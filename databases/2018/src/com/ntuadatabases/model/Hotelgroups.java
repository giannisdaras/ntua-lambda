package com.ntuadatabases.model;

public class Hotelgroups {
	
	private int hotel_group_id;
    private int number_of_hotels;
    private String street;
    private int num;
    private int postal_code;
    private  String city;
    private String name;
    
 
    public void setHotelgroupid(int hotel_group_id) {
        this.hotel_group_id=hotel_group_id;
    }
    public int getHotelgroupid() {
        return hotel_group_id;
    }
    public void setnumberofhotels(int number_of_hotels) {
    	this.number_of_hotels=number_of_hotels;
    }
    public int getnumberofhotels() {
        return number_of_hotels;
    }
    
    public void setname(String name) {
    	this.name=name;
    }
    
    public String getname() {
    	return name;
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
        return "Hotel [hotel_group_id=" + hotel_group_id +  ", number_of_hotels=" + number_of_hotels + ", street="
                + street + ",num=" +num+ ",postal_code =" + postal_code + ",city=" +city + "]";
    }    

}
