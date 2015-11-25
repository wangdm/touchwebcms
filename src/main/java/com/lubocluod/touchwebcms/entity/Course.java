package com.lubocluod.touchwebcms.entity;

import java.sql.Timestamp;
import java.util.List;

public class Course {
    
    public enum CourseStatus{
        REVIEW(0),UPCOMING(1),ONGOING(2),LIVING(3),FINISH(4),BLOCK(5),REVIEWERR(6);
        private CourseStatus(int val){
            this.val = val;
        }
        private int val;
        public int getValue(){
            return this.val;
        }
        public String toString(){
            switch(this.val){
            case 0:return "REVIEW";
            case 1:return "UPCOMING";
            case 2:return "ONGOING";
            case 3:return "LIVING";
            case 4:return "FINISH";
            case 5:return "BLOCK";
            case 6:return "REVIEWERR";
            default:return "REVIEW";
            }
        }
        public static CourseStatus valueOf(int val){
            switch(val){
            case 0:return REVIEW;
            case 1:return UPCOMING;
            case 2:return ONGOING;
            case 3:return LIVING;
            case 4:return FINISH;
            case 5:return BLOCK;
            case 6:return REVIEWERR;
            default:return null;
            }
        }
    }
    
    int id;
    int uid;
    int aid;
    int catId;
    String name;
    int price;
    String desc;
    String detail;
    String logo;
    String adimage;
    String property;
    int totalLesson;
    int curLesson;
    private Timestamp createTime;
    private Timestamp modifyTime;
    private Timestamp startTime;
    private Timestamp endTime;
    private Timestamp updateTime;
    int grade;
    int gradeCnt;
    int favoriteCnt;
    int greatCnt;
    int studyCnt;
    CourseStatus status;
    List<Lesson> lessons;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getAdimage() {
        return adimage;
    }

    public void setAdimage(String adimage) {
        this.adimage = adimage;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public int getTotalLesson() {
        return totalLesson;
    }

    public void setTotalLesson(int totalLesson) {
        this.totalLesson = totalLesson;
    }

    public int getCurLesson() {
        return curLesson;
    }

    public void setCurLesson(int curLesson) {
        this.curLesson = curLesson;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Timestamp modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public int getGradeCnt() {
        return gradeCnt;
    }

    public void setGradeCnt(int gradeCnt) {
        this.gradeCnt = gradeCnt;
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

    public int getStudyCnt() {
        return studyCnt;
    }

    public void setStudyCnt(int studyCnt) {
        this.studyCnt = studyCnt;
    }

    public CourseStatus getStatus() {
        return status;
    }

    public void setStatus(CourseStatus status) {
        this.status = status;
    }

    public List<Lesson> getLessons() {
        return lessons;
    }

    public void setLessons(List<Lesson> lessons) {
        this.lessons = lessons;
    }
}
