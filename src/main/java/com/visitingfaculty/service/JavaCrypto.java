package com.visitingfaculty.service;

import java.io.*;
import java.security.KeyFactory;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;

import javax.crypto.Cipher;
import javax.crypto.spec.OAEPParameterSpec;
import javax.crypto.spec.PSource;
import org.springframework.beans.factory.annotation.Value;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.nio.charset.*;
import java.nio.file.*;
import java.security.spec.*;
import java.util.Base64;

public class JavaCrypto {
    @Value("${publicKeyLocation}")
    private static String publicKeyLocation;
    
    
    public static RSAPublicKey readPublicKey(File file) throws Exception {
        String key = new String(Files.readAllBytes(file.toPath()), Charset.defaultCharset());

        byte[] encoded = Base64.getDecoder().decode(key);

        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(encoded);
        return (RSAPublicKey) keyFactory.generatePublic(keySpec);
    }
    
    public static RSAPrivateKey readPrivateKey(File file) throws Exception {
        String key = new String(Files.readAllBytes(file.toPath()), Charset.defaultCharset());
        byte[] encoded = Base64.getDecoder().decode(key);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(encoded);
		System.out.println("PrivateKey : "+(RSAPrivateKey) keyFactory.generatePrivate(keySpec));
        return (RSAPrivateKey) keyFactory.generatePrivate(keySpec);
    }

	public static String getDecipheredText(RSAPrivateKey priKey, String cipherText) throws Exception {
		
		byte[] cipherByte = Base64.getDecoder().decode(cipherText);

		Cipher decryptCipher = Cipher.getInstance("RSA/ECB/OAEPWithSHA-256AndMGF1Padding");
		OAEPParameterSpec oaepParameterSpecJCE = new OAEPParameterSpec("SHA-256", "MGF1", MGF1ParameterSpec.SHA256, PSource.PSpecified.DEFAULT);

		decryptCipher.init(Cipher.DECRYPT_MODE, priKey, oaepParameterSpecJCE);
		byte[] decipheredText = decryptCipher.doFinal(cipherByte);
		return new String(decipheredText);
	}
	
	   public static String getPublicKeyFromFile(String publicKeyLocation){
	        try {
	            File publicKeyFile = new File(publicKeyLocation);
	            BufferedReader br = new BufferedReader(new FileReader(publicKeyFile));
	                
	            String publicKey =  br.readLine();
	               
	            br.close();
	            return publicKey;
	        } catch (Exception e) {
                System.out.println("Exception : "+e);
	            return null;
	        }
	    } 
}
