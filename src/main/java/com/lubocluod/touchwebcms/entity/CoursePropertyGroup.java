package com.lubocluod.touchwebcms.entity;

import java.util.ArrayList;

public class CoursePropertyGroup {
    int propGroupId;
    String propGroupName;
    int catId;
    ArrayList<CoursePropertyItem> itemList;

    public int getPropGroupId() {
        return propGroupId;
    }

    public void setPropGroupId(int propGroupId) {
        this.propGroupId = propGroupId;
    }

    public String getPropGroupName() {
        return propGroupName;
    }

    public void setPropGroupName(String propGroupName) {
        this.propGroupName = propGroupName;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public ArrayList<CoursePropertyItem> getItemList() {
        return itemList;
    }

    public void setItemList(ArrayList<CoursePropertyItem> itemList) {
        this.itemList = itemList;
    }
}
