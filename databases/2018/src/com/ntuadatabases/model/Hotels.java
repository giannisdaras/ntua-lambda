package com.ntuadatabases.model;

public class Hotels {

	private int hotel_id;
    private int hotel_group_id;
    private String name;
    private int number_of_rooms;
    private int stars;
    private String street;
    private int num;
    private int postal_code;
    private String city;
    
    public int getHotelid() {
        return hotel_id;
    }
    public void setHotelid(int hotel_id) {
    	this.hotel_id=hotel_id;
    }
    public void setHotelgroupid(int hotel_group_id) {
        this.hotel_group_id=hotel_group_id;
    }
    public int getHotelgroupid() {
        return hotel_group_id;
    }
    
    public void setname(String name) {
    	this.name=name;
    }
    
    public String getname() {
    	return name;
    }
    public void setnumberofrooms(int number_of_rooms) {
    	this.number_of_rooms=number_of_rooms;
    }
    public int getnumberofrooms() {
        return number_of_rooms;
    }
    public int getstars() {
        return stars;
    }
    public void setstars(int stars) {
        this.stars = stars;
    }
    public String getStreet() {
        return street;
    }
    public void setStreet(String street) {
        this.street = street;
    }
    public int getpostalcode() {
        return postal_code;
    }
    public void setpostalcode(int postal_code) {
        this.postal_code = postal_code;
    }
 
    public int getnum() {
        return num;
    }
    public void setnum(int num) {
        this.num = num;
    }
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }
    @Override
    public String toString() {
        return "Hotel [hotel_id=" + hotel_id + ", hotel_group_id=" + hotel_group_id
                + ", stars=" + stars + ", number_of_rooms=" + number_of_rooms + ", street="
                + street + ",num=" +num+ ",postal_code =" + postal_code + ",city=" +city + "]";
    }    
}
