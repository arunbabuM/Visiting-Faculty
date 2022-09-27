package com.visitingfaculty.model;

public class ResetPassword {

    private int token;
    private String password;
    
    public ResetPassword(int token, String password) {
        this.token = token;
        this.password = password;
    }
    public ResetPassword() {
    }
    public int getToken() {
        return token;
    }
    public void setToken(int token) {
        this.token = token;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "ResetPassword [password=" + password + ", token=" + token + "]";
    }
    
}
