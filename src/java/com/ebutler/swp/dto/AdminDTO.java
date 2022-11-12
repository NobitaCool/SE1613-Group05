/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebutler.swp.dto;

/**
 *
 * @author Admin
 */
public class AdminDTO {
    private String username;
    private String password;
    private String role_ID;
    private int status;
    public AdminDTO() {
        this.username = "";
        this.password = "";
        this.role_ID = "";
        this.status = 1;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    

    public AdminDTO(String username, String password, String role_ID,int status) {
        this.username = username;
        this.password = password;
        this.role_ID = role_ID;
        this.status = status;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole_ID() {
        return role_ID;
    }

    public void setRole_ID(String role_ID) {
        this.role_ID = role_ID;
    }

    @Override
    public String toString() {
        return "AdminDTO{" + "username=" + username + ", password=" + password + ", role_ID=" + role_ID + ", status=" + status + '}';
    }

    
}
