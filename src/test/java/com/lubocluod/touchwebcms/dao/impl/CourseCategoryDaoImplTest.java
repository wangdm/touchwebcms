package com.lubocluod.touchwebcms.dao.impl;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Test;

import com.lubocluod.touchwebcms.dao.CourseCategoryDao;
import com.lubocluod.touchwebcms.entity.CourseCategory;

public class CourseCategoryDaoImplTest {

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
        fail("Not yet implemented");
    }

    @Test
    public void testFindChildCategory() {
        CourseCategoryDao test = new CourseCategoryDaoImpl();
        ArrayList<CourseCategory> list = (ArrayList<CourseCategory>)test.findChildCategory(1);
        for(int i=0; i<list.size(); i++)
        {
            System.out.println("id:"+list.get(i).getCatId()+"\tname:"+list.get(i).getCatName());
        }
        
    }

    @Test
    public void testFindParentCategory() {
        CourseCategoryDao test = new CourseCategoryDaoImpl();
        ArrayList<CourseCategory> list = (ArrayList<CourseCategory>)test.findParentCategory(23);
        for(int i=0; i<list.size(); i++)
        {
            System.out.println("id:"+list.get(i).getCatId()+"\tname:"+list.get(i).getCatName());
        }
        
    }

}
