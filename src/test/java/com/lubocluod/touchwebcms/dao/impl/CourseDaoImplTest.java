package com.lubocluod.touchwebcms.dao.impl;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.lubocluod.touchwebcms.dao.CourseDao;
import com.lubocluod.touchwebcms.entity.Course;

public class CourseDaoImplTest {

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
    public void testFindAll() {
        CourseDao courseDao = new CourseDaoImpl();
        ArrayList<Course> courselist = (ArrayList<Course>)courseDao.findAll();
        for(int i=0; i<courselist.size(); i++)
        {
            Course course = courselist.get(i);
            System.out.println("id:"+course.getId()+"\tname:"+course.getName()+"\tcatId:"+course.getCatId());
        }
    }

    @Test
    public void testFindCoursebyCategory() {
        CourseDao courseDao = new CourseDaoImpl();
        ArrayList<Course> courselist = (ArrayList<Course>)courseDao.findCoursebyCategory(4);
        for(int i=0; i<courselist.size(); i++)
        {
            Course course = courselist.get(i);
            System.out.println("id:"+course.getId()+"\tname:"+course.getName()+"\tcatId:"+course.getCatId());
        }
    }

}
