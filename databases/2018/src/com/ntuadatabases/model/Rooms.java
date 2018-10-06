package com.ntuadatabases.model;

public class Rooms {
	private int room_id;
    private int hotel_id;
    private float price;
    private int repairs_needed;
    private int expandable;
    private int view;
    private int capacity;
    
    
    public int getroomid() {
        return room_id;
    }
    public void setroomid(int room_id) {
    	this.room_id=room_id;
    }
    public void sethotelid(int hotel_id) {
        this.hotel_id=hotel_id;
    }
    public int gethotelid() {
        return hotel_id;
    }
    public void setprice(float price) {
    	this.price=price;
    }
    public float getprice() {
        return price;
    }
    public int getrepairsneeded() {
        return repairs_needed;
    }
    public void setrepairsneeded(int repairs_needed) {
        this.repairs_needed = repairs_needed;
    }
    public int getexpandable() {
        return expandable;
    }
    public void setexpandable(int expandable) {
        this.expandable = expandable;
    }
    public int getview() {
        return view;
    }
    public void setview(int view) {
        this.view = view;
    }
 
    public int getcapacity() {
        return capacity;
    }
    public void setcapacity(int capacity) {
        this.capacity = capacity;
    }
   
    @Override
    public String toString() {
        return "Room [room_id=" + room_id + ", hotel_id=" + hotel_id
                + ", price=" + price + ", repairs_needed=" + repairs_needed + ", expandable="
                + expandable + ",view=" +view+ ",capacity =" + capacity + "]";
    }  
}
