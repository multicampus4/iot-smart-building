package com.example.sensorswitch;

public class MyGlobals {
    private Integer gWidth;
    private Integer gHeight;
    private Boolean frgment1on;
    private Boolean frgment2on;
    private Boolean frgment3on;

    public Boolean getFrgment1on() {
        return frgment1on;
    }

    public void setFrgment1on(Boolean frgment1on) {
        this.frgment1on = frgment1on;
    }

    public Boolean getFrgment2on() {
        return frgment2on;
    }

    public void setFrgment2on(Boolean frgment2on) {
        this.frgment2on = frgment2on;
    }

    public Boolean getFrgment3on() {
        return frgment3on;
    }

    public void setFrgment3on(Boolean frgment3on) {
        this.frgment3on = frgment3on;
    }

    public Integer getWidth() {
        return gWidth;
    }

    public void setWidth(Integer width) {
        this.gWidth = width;
    }

    public Integer getHeight() {
        return gHeight;
    }
    public void setHeight(Integer height) {
        this.gHeight = height;
    }

    private static MyGlobals instance = null;

    public static synchronized MyGlobals getInstance() {
        if (null == instance) {
            instance = new MyGlobals();
        }
        return instance;
    }
}


