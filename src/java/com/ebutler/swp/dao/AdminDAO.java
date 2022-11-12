/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ebutler.swp.dao;

import com.ebutler.swp.dto.AdminDTO;
import com.ebutler.swp.dto.ProviderDTO;
import com.ebutler.swp.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class AdminDAO {
    
    private final String GET_ADMIN = "select * from tblAdmin";
    
    public List<AdminDTO> getAllAdmin() throws SQLException {
        List<AdminDTO> list = new ArrayList<>();
        
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ADMIN);
                rs = ptm.executeQuery();
                
                while (rs.next()) {
                    
                    list.add(new AdminDTO(rs.getString(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getInt(4)));
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        
        return list;
    }
    
    private final String INSERT = "INSERT tblAdmin (user_Name, password, role_ID,status) VALUES (?, ?, ?,?)";
//    private final String INSERT = "INSERT tblAdmin (user_Name, password, role_ID) VALUES ('a', 'a', '01')";

    public boolean AddAdmin(AdminDTO admin) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, admin.getUsername());
                ptm.setString(2, admin.getPassword());
                ptm.setString(3, admin.getRole_ID());
                ptm.setInt(4, admin.getStatus());
                
                if (admin.getUsername().equals("")) {
                    return false;
                }
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return false;
        
    }
    
    private final String DELETE = "DELETE from [SWP391_Project].[dbo].[tblAdmin] where user_Name = ?";
    
    public void deleteAdmin(String username) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, username);
                ptm.executeUpdate();
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        
    }

    // lay ten tat ca admin
    public List<String> getAllRoleName() throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        List<String> list = new ArrayList<>();
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                ptm = conn.prepareStatement("select role_Name from tblAdmin a, tblAdminRole b where a.role_ID = b.role_ID");
                rs = ptm.executeQuery();
                
                while (rs.next()) {
                    list.add(rs.getString(1));
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        
        return list;
    }

    // lay tat ca ten role trong bang role
    public List<String> getRoleName() throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        List<String> list = new ArrayList<>();
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                ptm = conn.prepareStatement("select role_Name from tblAdminRole");
                rs = ptm.executeQuery();
                
                while (rs.next()) {
                    list.add(rs.getString(1));
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        
        return list;
    }
    private final String UPDATE = "update tblAdmin set role_ID=? where user_Name=? ";
    
    public List<String> updateAd(String username, String role_ID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        List<String> list = new ArrayList<>();
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                rs = ptm.executeQuery();
                
                while (rs.next()) {
                    ptm = conn.prepareStatement(UPDATE);
                    
                    ptm.setString(1, role_ID);
                    ptm.setString(2, username);
                    
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        
        return list;
    }
    private final String UPDATE1 = "select * from [dbo].[tblAdmin] where user_Name = ? ";
    
    public AdminDTO getAdminByUser(String user) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE1);
                ptm.setString(1, user);
                rs = ptm.executeQuery();
                
                while (rs.next()) {
                    return new AdminDTO(rs.getString(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getInt(4));
                    
                }
            }
            
        } catch (Exception e) {
            
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return null;
    }

    //update role 
    private final String UPDATE_ROLE = "update tblAdmin set role_ID=? where user_Name=?";
    
    public void UpdateRoleByUsername(String username, String role_ID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_ROLE);
                ptm.setString(1, role_ID);
                ptm.setString(2, username);
                
                ptm.executeUpdate();
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        
    }
    private final String SEARCH_US = "SELECT user_Name from tblAdmin WHERE user_Name LIKE ?";
    
    public boolean isExisted(String username) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_US);
                ptm.setString(1, username);
                rs = ptm.executeQuery();
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        
        return true;
    }
    private static final String GET_SEARCH_ADMIN = "select * from tblAdmin where user_Name like ?";
    
    public static List<AdminDTO> searchAdminByName(String userSearch) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<AdminDTO> list = new ArrayList();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_SEARCH_ADMIN);
            ptm.setString(1, "%" + userSearch + "%");
            
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new AdminDTO(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        
        return list;
    }
    
    private final String SEARCH_US_PW = "SELECT * from tblAdmin WHERE user_Name LIKE ? AND password LIKE ? ";
    
    public AdminDTO Login(String username, String password) throws SQLException {
        AdminDTO admin = new AdminDTO();
        
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_US_PW);
                ptm.setString(1, username);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String role_ID = rs.getString("role_ID");
                    int status = rs.getInt("status");
                    admin = new AdminDTO(username, password, role_ID, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        
        return admin;
    }
    private final String GET_ADMIN_INFO = "SELECT user_Name, password , role_ID, status  FROM tblAdmin WHERE user_Name = ? AND password = ?";
    
    public AdminDTO getAdmin(String username, String password) throws SQLException {
        AdminDTO admin = new AdminDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ADMIN_INFO);
                ptm.setString(1, username);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    admin = new AdminDTO(rs.getString(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getInt(4)
                    );
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return admin;
    }
    
    public List<AdminDTO> searchAdmin(AdminDTO admin, String search) throws SQLException {
        List<AdminDTO> listAdmin = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_SEARCH_ADMIN);
                ptm.setString(1, admin.getUsername());
                ptm.setString(2, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    listAdmin.add(new AdminDTO(rs.getString(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getInt(4)));
                }
            }
            
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listAdmin;
    }
    private final String CHANGE_PASSWORD = "UPDATE tblAdmin SET password = ? WHERE user_Name = ? ";
    
    public boolean changePassword(String username, String newPassword) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHANGE_PASSWORD);
                ptm.setString(1, newPassword);
                ptm.setString(2, username);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    private final String GET_CURRENT_PSW = "SELECT password from tblAdmin WHERE user_Name = ?";
    
    public String getCurrentCustomerPassword(String username) throws SQLException {
        String currentPsw = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_CURRENT_PSW);
                ptm.setString(1, username);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    currentPsw = rs.getString("password");
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        
        return currentPsw;
    }
    
    private final String UPDATE_STATUS = "update tblAdmin set status=? where user_name=?";
    
    public void UpdateStatus(String username, String status) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_STATUS);
                ptm.setString(1, status);
                ptm.setString(2, username);
                
                ptm.executeUpdate();
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        
    }
    
}
