package com.lubocluod.touchwebcms.dao;

import java.util.List;

import com.lubocluod.touchwebcms.entity.Channel;

public interface ChannelDao {
	public int add(Channel c);
	public boolean delete(int id);
	public boolean update(Channel c);
    public boolean control(int id, int cmd);
	public Channel find(int id);
    public List<Channel> findByUser(int uid);
	public List<Channel> findAll();
}
