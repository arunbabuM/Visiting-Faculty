package com.visitingfaculty.model;

public class SchoolList {
    
    private String organization_id;
    private String name;
    
    public String getOrganization_id() {
        return organization_id;
    }
    public void setOrganization_id(String organization_id) {
        this.organization_id = organization_id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public SchoolList() {
    }
    public SchoolList(String organization_id, String name) {
        this.organization_id = organization_id;
        this.name = name;
    }
    @Override
    public String toString() {
        return "SchoolList [name=" + name + ", organization_id=" + organization_id + "]";
    }
    
}
