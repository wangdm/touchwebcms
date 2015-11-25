package com.lubocluod.touchwebcms.entity;

import java.sql.Time;
import java.sql.Timestamp;

public class Lesson {
    int id;
    int courseId;
    int videoId;
    String title;
    String desc;
    Time duration;
    String videoUri;
    int status;
    boolean free;
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

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Time getDuration() {
        return duration;
    }

    public void setDuration(Time duration) {
        this.duration = duration;
    }

    public String getVideoUri() {
        return videoUri;
    }

    public void setVideoUri(String videoUri) {
        this.videoUri = videoUri;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public boolean isFree() {
        return free;
    }

    public void setFree(boolean free) {
        this.free = free;
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
