package com.lubocluod.touchwebcms.dao;

import java.util.List;

import com.lubocluod.touchwebcms.entity.Hotspot;

public interface HotspotDao {
    public int add(Hotspot hot);
    public boolean delete(int id);
    public boolean update(Hotspot hot);
    public Hotspot find(int id);
    List<Hotspot> findAll();
    List<Hotspot> findImageHotspot(int cnt,int catId);
    List<Hotspot> findTextHotspot(int cnt,int catId);
}
