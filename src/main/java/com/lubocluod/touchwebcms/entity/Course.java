package com.lubocluod.touchwebcms.entity;

import java.sql.Timestamp;

public class Course {
    int id;
    int uid;
    int catId;
    String name;
    int price;
    String Desc;
    String logo;
    String adimage;
    String property;
    private Timestamp createTime;
    private Timestamp updateTime;
    private Timestamp modifyTime;
    int favoriteCnt;
    int greatCnt;
    int studyCnt;

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
        return Desc;
    }

    public void setDesc(String desc) {
        Desc = desc;
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
}
