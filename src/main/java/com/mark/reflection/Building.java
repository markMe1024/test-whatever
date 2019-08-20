package com.mark.reflection;

/**
 * 建筑
 * @author mark
 */
public class Building  {
    /**
     * 位置
     */
    private String location;

    /**
     * 建筑风格
     */
    private String architecturalStyle;

    /**
     * 楼有几层
     */
    private int floors;

    public Building() { }

    public Building(String location, String architecturalStyle, int floors) {
        this.location = location;
        this.architecturalStyle = architecturalStyle;
        this.floors = floors;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getArchitecturalStyle() {
        return architecturalStyle;
    }

    public void setArchitecturalStyle(String architecturalStyle) {
        this.architecturalStyle = architecturalStyle;
    }

    public int getFloors() {
        return floors;
    }

    public void setFloors(int floors) {
        this.floors = floors;
    }
}