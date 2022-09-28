package com.visitingfaculty.dto;

public class UserDto {

    private int id;
    private int level;
    private String user_id;
    private String password;
    private String email;
    private String name;
    private String organization_lid;
    public UserDto() {
    }
    public UserDto(int id, int level, String user_id, String password, String email, String name,
            String organization_lid) {
        this.id = id;
        this.level = level;
        this.user_id = user_id;
        this.password = password;
        this.email = email;
        this.name = name;
        this.organization_lid = organization_lid;
    }

    
    public UserDto(int level, int id, String user_id, String name, String organization_lid) {
        this.level = level;
        this.id = id;
        this.user_id = user_id;
        this.name = name;
        this.organization_lid = organization_lid;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getLevel() {
        return level;
    }
    public void setLevel(int level) {
        this.level = level;
    }
    public String getUser_id() {
        return user_id;
    }
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getOrganization_lid() {
        return organization_lid;
    }
    public void setOrganization_lid(String organization_lid) {
        this.organization_lid = organization_lid;
    }
    @Override
    public String toString() {
        return "UserDto [email=" + email + ", id=" + id + ", level=" + level + ", name=" + name + ", organization_lid="
                + organization_lid + ", password=" + password + ", user_id=" + user_id + "]";
    }
    
   
}
