package com.lubocluod.touchwebcms.dao;

import java.util.List;

import com.lubocluod.touchwebcms.entity.Role;

public interface RoleDao {
	public boolean add(Role r);
	public boolean delete(int id);
	public boolean update(Role r);
	public Role find(String username);
	public Role find(int id);
	public List<Role> findAll();
}
