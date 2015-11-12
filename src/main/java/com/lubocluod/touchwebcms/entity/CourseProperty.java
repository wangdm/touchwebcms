package com.lubocluod.touchwebcms.entity;

public class CourseProperty {
    int propId;
    int catId;
    String propName;
    int parentId;

    public int getPropId() {
        return propId;
    }

    public void setPropId(int propId) {
        this.propId = propId;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getPropName() {
        return propName;
    }

    public void setPropName(String propName) {
        this.propName = propName;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int paretnId) {
        this.parentId = paretnId;
    }

}
