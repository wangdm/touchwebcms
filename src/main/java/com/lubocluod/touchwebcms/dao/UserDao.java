package com.lubocluod.touchwebcms.dao;

import java.util.List;

import com.lubocluod.touchwebcms.domain.User;

public interface UserDao {
	public boolean add(User u);
	public boolean delete(User u);
	public boolean update(User u);
	public User find(String username);
	public List<User> findAll();
}
