package com.lubocluod.touchwebcms.dao;

import java.util.List;

import com.lubocluod.touchwebcms.entity.NavMenu;

public interface NavMenuDao {
    public int add(NavMenu menu);
    public boolean delete(int id);
    public boolean update(NavMenu menu);
    public NavMenu find(int id);
    public List<NavMenu> findAll();
}
