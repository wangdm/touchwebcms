package com.lubocluod.touchwebcms.dao.impl;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Test;

import com.lubocluod.touchwebcms.dao.CoursePropertyGroupDao;
import com.lubocluod.touchwebcms.entity.CoursePropertyGroup;
import com.lubocluod.touchwebcms.entity.CoursePropertyItem;

public class CoursePropertyGroupDaoImplTest {

    @Test
    public void testAdd() {
        CoursePropertyGroupDao propGroupDao = new CoursePropertyGroupDaoImpl();
        CoursePropertyGroup propGroup = new CoursePropertyGroup();
        ArrayList<CoursePropertyItem> itemList = new ArrayList<CoursePropertyItem>();
        CoursePropertyItem propItem = new CoursePropertyItem();
        propGroup.setCatId(5);
        propGroup.setPropGroupName("level");
        propItem.setPropItemName("level1");
        itemList.add(propItem);
        propItem = new CoursePropertyItem();
        propItem.setPropItemName("level2");
        itemList.add(propItem);
        propGroup.setItemList(itemList);
        propGroupDao.add(propGroup);
    }

    @Test
    public void testDelete() {
        CoursePropertyGroupDao propGroupDao = new CoursePropertyGroupDaoImpl();
        propGroupDao.delete(6);
    }

    @Test
    public void testUpdate() {
        CoursePropertyGroupDao propGroupDao = new CoursePropertyGroupDaoImpl();
        CoursePropertyGroup propGroup = propGroupDao.find(5);
        propGroup.setPropGroupName("Grade");
        propGroupDao.update(propGroup);
    }

    @Test
    public void testFind() {
        CoursePropertyGroupDao propGroupDao = new CoursePropertyGroupDaoImpl();
        CoursePropertyGroup propGroup = propGroupDao.find(5);
        System.out.println("id:"+propGroup.getPropGroupId()+"\tname:"+propGroup.getPropGroupName()+"\tcatId:"+propGroup.getCatId());
    }

    @Test
    public void testFindAll() {
        CoursePropertyGroupDao propGroupDao = new CoursePropertyGroupDaoImpl();
        ArrayList<CoursePropertyGroup> list = (ArrayList<CoursePropertyGroup>)propGroupDao.findAll();
        for(int i=0; i<list.size(); i++)
        {
            CoursePropertyGroup propGroup = list.get(i);
            System.out.println("id:"+propGroup.getPropGroupId()+"\tname:"+propGroup.getPropGroupName()+"\tcatId:"+propGroup.getCatId());
        }
    }

    @Test
    public void testFindCoursePropertyGroup() {
        CoursePropertyGroupDao propGroupDao = new CoursePropertyGroupDaoImpl();
        ArrayList<CoursePropertyGroup> list = (ArrayList<CoursePropertyGroup>)propGroupDao.findCoursePropertyGroup(5);
        for(int i=0; i<list.size(); i++)
        {
            CoursePropertyGroup propGroup = list.get(i);
            System.out.println("id:"+propGroup.getPropGroupId()+"\tname:"+propGroup.getPropGroupName()+"\tcatId:"+propGroup.getCatId());
        }
    }

    @Test
    public void testDeleteCoursePropertyGroup() {
        CoursePropertyGroupDao propGroupDao = new CoursePropertyGroupDaoImpl();
        propGroupDao.deleteCoursePropertyGroup(5);
    }

}
