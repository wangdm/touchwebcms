package com.lubocluod.touchwebcms.entity;

public class NavMenu {
    int navId;
    String navName;
    String navUrl;
    int navIndex;

    public int getNavId() {
        return navId;
    }

    public void setNavId(int navId) {
        this.navId = navId;
    }

    public String getNavName() {
        return navName;
    }

    public void setNavName(String navName) {
        this.navName = navName;
    }

    public String getNavUrl() {
        return navUrl;
    }

    public void setNavUrl(String navUrl) {
        this.navUrl = navUrl;
    }

    public int getNavIndex() {
        return navIndex;
    }

    public void setNavIndex(int navIndex) {
        this.navIndex = navIndex;
    }
}
