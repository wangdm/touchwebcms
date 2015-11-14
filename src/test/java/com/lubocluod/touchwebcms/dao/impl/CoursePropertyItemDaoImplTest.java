package com.lubocluod.touchwebcms.dao.impl;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.lubocluod.touchwebcms.dao.CoursePropertyItemDao;
import com.lubocluod.touchwebcms.entity.CoursePropertyItem;

public class CoursePropertyItemDaoImplTest {

    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        System.out.println("@BeforeClass");
    }

    @AfterClass
    public static void tearDownAfterClass() throws Exception {
        System.out.println("@AfterClass");
    }

    @Before
    public void setUp() throws Exception {
        System.out.println("@Before");
    }

    @After
    public void tearDown() throws Exception {
        System.out.println("@After");
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
        CoursePropertyItemDao propItemDao = new CoursePropertyItemDaoImpl();
        ArrayList<CoursePropertyItem> itemList = (ArrayList<CoursePropertyItem>)propItemDao.findAll();
        for(int i=0; i<itemList.size(); i++)
        {
            CoursePropertyItem propItem = itemList.get(i);
            System.out.println("id:"+propItem.getPropItemId()+"\tname:"+propItem.getPropItemName()+"\tgroupId:"+propItem.getPropGroupId());
        }
    }

    @Test
    public void testFindCoursePropertyItem() {
        CoursePropertyItemDao propItemDao = new CoursePropertyItemDaoImpl();
        ArrayList<CoursePropertyItem> itemList = (ArrayList<CoursePropertyItem>)propItemDao.findCoursePropertyItem(7);
        for(int i=0; i<itemList.size(); i++)
        {
            CoursePropertyItem propItem = itemList.get(i);
            System.out.println("id:"+propItem.getPropItemId()+"\tname:"+propItem.getPropItemName()+"\tgroupId:"+propItem.getPropGroupId());
        }
    }

    @Test
    public void testDeleteCoursePropertyItem() {
        fail("Not yet implemented");
    }

}
