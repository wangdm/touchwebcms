package com.lubocluod.touchwebcms.dao.impl;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.lubocluod.touchwebcms.dao.HotspotDao;
import com.lubocluod.touchwebcms.entity.Hotspot;

public class HotspotDaoImplTest {

    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
    }

    @AfterClass
    public static void tearDownAfterClass() throws Exception {
    }

    @Test
    public void testAdd() {
        Hotspot hot = new Hotspot();
        HotspotDao hotspotDao = new HotspotDaoImpl();
        hot.setCatId(0);
        hot.setTitle("Hotspot 2");
        hot.setImageuri("asset/image/hotspot02.jpg");
        hot.setUrl("course.jsp?courseId=2");
        hot.setType(0);
        hot.setCreatetime(new Timestamp(new Date().getTime()));
        hot.setDeadtime(new Timestamp(new Date().getTime()+7*24*60*60*1000));
        hotspotDao.add(hot);
    }

    @Test
    public void testDelete() {
        HotspotDao hotspotDao = new HotspotDaoImpl();
        hotspotDao.delete(1);
    }

    @Test
    public void testUpdate() {
        Hotspot hot = new Hotspot();
        HotspotDao hotspotDao = new HotspotDaoImpl();
        hot = hotspotDao.find(3);
        hot.setImageuri("asset/image/hot201511180946402570.jpg");
        hot.setTitle("Hotspot 3");
        hot.setUrl("http://192.168.2.251:8080/touchwebcms/course.jsp?courseId=3");
        hot.setType(1);
        hotspotDao.update(hot);
    }

    @Test
    public void testFind() {
        Hotspot hot = new Hotspot();
        HotspotDao hotspotDao = new HotspotDaoImpl();
        hot = hotspotDao.find(1);
        System.out.println(hot.getId()+"\t"+hot.getTitle()+"\t"+hot.getUrl());
    }

    @Test
    public void testFindAll() {
        Hotspot hot = new Hotspot();
        HotspotDao hotspotDao = new HotspotDaoImpl();
        ArrayList<Hotspot> hotlist= (ArrayList<Hotspot>)hotspotDao.findAll();
        for(int i=0; i<hotlist.size();i++){
            hot = hotlist.get(i);
            System.out.println(hot.getId()+"\t"+hot.getTitle()+"\t"+hot.getUrl());
        }
    }

    @Test
    public void testFindImageHotspot() {
        Hotspot hot = new Hotspot();
        HotspotDao hotspotDao = new HotspotDaoImpl();
        ArrayList<Hotspot> hotlist= (ArrayList<Hotspot>)hotspotDao.findImageHotspot(5, 0);
        for(int i=0; i<hotlist.size();i++){
            hot = hotlist.get(i);
            System.out.println(hot.getId()+"\t"+hot.getTitle()+"\t"+hot.getUrl());
        }
    }

    @Test
    public void testFindTextHotspot() {
        Hotspot hot = new Hotspot();
        HotspotDao hotspotDao = new HotspotDaoImpl();
        ArrayList<Hotspot> hotlist= (ArrayList<Hotspot>)hotspotDao.findTextHotspot(10, 0);
        for(int i=0; i<hotlist.size();i++){
            hot = hotlist.get(i);
            System.out.println(hot.getId()+"\t"+hot.getTitle()+"\t"+hot.getUrl());
        }
    }

}
