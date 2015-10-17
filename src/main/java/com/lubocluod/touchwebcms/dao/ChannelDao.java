package com.lubocluod.touchwebcms.dao;

import java.util.List;

import com.lubocluod.touchwebcms.entity.Channel;

public interface ChannelDao {
	public boolean add(Channel u);
	public boolean delete(int id);
	public boolean update(Channel u);
	public Channel find(int id);
	public List<Channel> findAll();
}
