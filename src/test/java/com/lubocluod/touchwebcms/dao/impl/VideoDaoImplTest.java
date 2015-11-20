package com.lubocluod.touchwebcms.dao.impl;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.lubocluod.touchwebcms.dao.VideoDao;
import com.lubocluod.touchwebcms.entity.Video;

public class VideoDaoImplTest {

    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
    }

    @AfterClass
    public static void tearDownAfterClass() throws Exception {
    }

    @Test
    public void testAdd() {
        fail("Not yet implemented");
    }

    @Test
    public void testDelete() {
        fail("Not yet implemented");
    }

    @Test
    public void testUpdate() {
        fail("Not yet implemented");
    }

    @Test
    public void testFind() {
        fail("Not yet implemented");
    }

    @Test
    public void testFindCourseVideo() {
        fail("Not yet implemented");
    }

    @Test
    public void testDeleteCourseVideo() {
        VideoDao videoDao = new VideoDaoImpl();
        ArrayList<Video> videolist = (ArrayList<Video>)videoDao.findCourseVideo(1);
        if(videolist!=null && videolist.size()>0)
        {
            for(int i=0; i<videolist.size(); i++)
            {
                Video video = videolist.get(i);
                System.out.println("id:"+video.getId()+"\ttitle:"+video.getTitle()+"\turl:"+video.getVideoUri());
            }
        }
    }

    @Test
    public void testFindAll() {
        fail("Not yet implemented");
    }

}
