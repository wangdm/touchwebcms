package com.lubocluod.touchwebcms.entity;

import java.sql.Timestamp;

public class Video {
    int id;
    int courseId;
    String title;
    int duration;
    String desc;
    private Timestamp createTime;
    private Timestamp updateTime;
    int favoriteCnt;
    int greatCnt;
    int playCnt;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public int getFavoriteCnt() {
        return favoriteCnt;
    }

    public void setFavoriteCnt(int favoriteCnt) {
        this.favoriteCnt = favoriteCnt;
    }

    public int getGreatCnt() {
        return greatCnt;
    }

    public void setGreatCnt(int greatCnt) {
        this.greatCnt = greatCnt;
    }

    public int getPlayCnt() {
        return playCnt;
    }

    public void setPlayCnt(int playCnt) {
        this.playCnt = playCnt;
    }
}
