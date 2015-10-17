package com.lubocluod.touchwebcms.dao;

import java.util.List;

import com.lubocluod.touchwebcms.entity.User;

public interface UserDao {
	public boolean add(User u);
	public boolean delete(int id);
	public boolean update(User u);
	public User find(String username);
	public User find(int id);
	public List<User> findAll();
}
