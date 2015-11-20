package com.lubocluod.touchwebcms.entity;

import java.sql.Timestamp;

public class Course {
    
    public enum CourseStatus{
        REVIEW(0),UPCOMING(1),ONGOING(2),LIVING(3),FINISH(4),BLOCK(5);
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
    private Timestamp createTime;
    private Timestamp updateTime;
    private Timestamp modifyTime;
    int grade;
    int gradeCnt;
    int favoriteCnt;
    int greatCnt;
    int studyCnt;
    CourseStatus status;

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

    public Timestamp getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Timestamp modifyTime) {
        this.modifyTime = modifyTime;
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
}
