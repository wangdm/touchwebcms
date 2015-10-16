package com.lubocluod.touchwebcms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lubocluod.touchwebcms.dao.DataConnection;
import com.lubocluod.touchwebcms.dao.RoleDao;
import com.lubocluod.touchwebcms.entity.Role;
import com.lubocluod.touchwebcms.entity.User;

public class RoleDaoImpl implements RoleDao {

	private Connection conn;
    private PreparedStatement stat = null;
	
	public RoleDaoImpl(){
		try {
			this.conn = DataConnection.getConnection();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SQLException e){
			e.printStackTrace();
		}
	}
	
	@Override
	public boolean add(Role u) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Role u) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Role u) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Role find(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Role> findAll() {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub 
//        String sql = "SELECT username,role,fullname,email,phone FROM user";  
//        try {
//			stat = conn.prepareStatement(sql);
//	        ResultSet rs = stat.executeQuery();  
			List<Role> list = new ArrayList<Role>();
	        Role r = null;  
	       for(int i=0; i<5; i++){  
	            r = new Role(); 
	            r.setType(i);
	            String str = String.format("Role%d", i);
	            r.setTitle(str);
	            list.add(r);
	        }  
	        return list;
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} 
//		return null;
	}

}
