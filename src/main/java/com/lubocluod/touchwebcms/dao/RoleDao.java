package com.lubocluod.touchwebcms.dao;

import java.util.List;

import com.lubocluod.touchwebcms.entity.Role;

public interface RoleDao {
	public boolean add(Role u);
	public boolean delete(Role u);
	public boolean update(Role u);
	public Role find(String username);
	public List<Role> findAll();
}
