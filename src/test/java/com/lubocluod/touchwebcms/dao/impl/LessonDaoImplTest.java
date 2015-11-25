package com.lubocluod.touchwebcms.dao.impl;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.lubocluod.touchwebcms.dao.LessonDao;
import com.lubocluod.touchwebcms.entity.Lesson;

public class LessonDaoImplTest {

    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
    }

    @AfterClass
    public static void tearDownAfterClass() throws Exception {
    }

    @Test
    public void testLessonDaoImpl() {
        fail("Not yet implemented");
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
        LessonDao lessonDao = new LessonDaoImpl();
        Lesson lesson = lessonDao.find(1);
        if(lesson!=null)
        {
            System.out.println("id:"+lesson.getId()+"\ttitle:"+lesson.getTitle()+"\turl:"+lesson.getVideoUri());

        }
    }

    @Test
    public void testFindCourseLesson() {
        LessonDao lessonDao = new LessonDaoImpl();
        ArrayList<Lesson> lessonlist = (ArrayList<Lesson>)lessonDao.findCourseLesson(1);
        if(lessonlist!=null && lessonlist.size()>0)
        {
            for(int i=0; i<lessonlist.size(); i++)
            {
                Lesson lesson = lessonlist.get(i);
                System.out.println("id:"+lesson.getId()+"\ttitle:"+lesson.getTitle()+"\turl:"+lesson.getVideoUri());
            }
        }
    }

    @Test
    public void testDeleteCourseLesson() {
        fail("Not yet implemented");
    }

    @Test
    public void testFindAll() {
        fail("Not yet implemented");
    }

}
