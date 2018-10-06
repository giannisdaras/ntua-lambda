package com.ntuadatabases.dao;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.ntuadatabases.model.Hotels;
import com.ntua.databases.Connector;
public class hotelsdao {
	
	private Connection connection;

    public hotelsdao() {
        connection = Connector.grabConnection();
    }

    public boolean addHotel(Hotels hotel) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into hotel(hotel_group_id,number_of_rooms,name,stars,street,num,postal_code,city) values (?, 0, ?, ?, ?, ?, ?, ? )");
            // Parameters start with 1
            preparedStatement.setInt(1, hotel.getHotelgroupid());
            preparedStatement.setString(2, hotel.getname());
            preparedStatement.setInt(3, hotel.getstars());
            preparedStatement.setString(4,hotel.getStreet());
            preparedStatement.setInt(5, hotel.getnum());
            preparedStatement.setInt(6, hotel.getpostalcode());
            preparedStatement.setString(7, hotel.getCity());
            preparedStatement.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteHotel(int hotel_id) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from hotel where hotel_id=?");
            // Parameters start with 1
            preparedStatement.setInt(1, hotel_id);
            preparedStatement.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateHotel(Hotels hotel) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update hotel set hotel_group_id=?,name=? ,stars=?, street=?, num=?, postal_code=?, city=? where hotel_id=?");
            // Parameters start with 1
            preparedStatement.setInt(1, hotel.getHotelgroupid());
            preparedStatement.setString(2, hotel.getname());
            preparedStatement.setInt(3, hotel.getstars());
            preparedStatement.setString(4,hotel.getStreet());
            preparedStatement.setInt(5, hotel.getnum());
            preparedStatement.setInt(6, hotel.getpostalcode());
            preparedStatement.setString(7, hotel.getCity());
            preparedStatement.setInt(8, hotel.getHotelid());
            preparedStatement.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Hotels> getAllHotels() {
        List<Hotels> hotels = new ArrayList<Hotels>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from hotel");
            while (rs.next()) {
                Hotels hotel = new Hotels();
                hotel.setHotelid(rs.getInt("hotel_id"));
                hotel.setHotelgroupid(rs.getInt("hotel_group_id"));
                hotel.setname(rs.getString("name"));
                hotel.setstars(rs.getInt("stars"));
                hotel.setnumberofrooms(rs.getInt("number_of_rooms"));
                hotel.setStreet(rs.getString("street"));
                hotel.setnum(rs.getInt("num"));
                hotel.setpostalcode(rs.getInt("postal_code"));
                hotel.setCity(rs.getString("city"));
                hotels.add(hotel);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return hotels;
    }
    
    public List<String> getAllMails(int hotel_id) {
    	List<String> emails=new ArrayList<String>();
    	try {
    			PreparedStatement preparedStatement=connection.prepareStatement("select * from hotel_emails where hotel_id=?");
    			preparedStatement.setInt(1,hotel_id);
    			ResultSet rs=preparedStatement.executeQuery();
    			while(rs.next()) {
    			String s=rs.getString("email");
    			emails.add(s);
    			}
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	return emails;
    }
    public boolean addmail(int hotel_id,String mail) {
    	try {
    		PreparedStatement preparedStatement =connection.prepareStatement("insert into hotel_emails(hotel_id,email) values (?, ?)");
    		preparedStatement.setInt(1,hotel_id);
    		preparedStatement.setString(2,mail);
    		preparedStatement.executeUpdate();
    		return true;
    	}
    	catch(SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
    public boolean deletemail(int hotel_id,String mail) {
    	try {
    		PreparedStatement preparedStatement =connection.prepareStatement("delete from hotel_emails where hotel_id=? and email=?");
    		preparedStatement.setInt(1,hotel_id);
    		preparedStatement.setString(2,mail);
    		preparedStatement.executeUpdate();
    		return true;	
    		    				
    	}
    	catch(SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
    
    /*same operations for phones */
    
    public List<Long> getAllPhones(int hotel_id) {
    	List<Long> phones=new ArrayList<Long>();
    	try {
    			PreparedStatement preparedStatement=connection.prepareStatement("select * from hotel_phones where hotel_id=?");
    			preparedStatement.setInt(1,hotel_id);
    			ResultSet rs=preparedStatement.executeQuery();
    			while(rs.next()) {
    			Long s=rs.getLong("phone");
    			phones.add(s);
    			}
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	return phones;
    }
    public boolean addphone(int hotel_id,long phone) {
    	try {
    		PreparedStatement preparedStatement =connection.prepareStatement("insert into hotel_phones(hotel_id,phone) values (?, ?)");
    		preparedStatement.setInt(1,hotel_id);
    		preparedStatement.setLong(2,phone);
    		preparedStatement.executeUpdate();
    		return true;
    		
    	}
    	catch(SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
    public boolean deletephone(int hotel_id,long phone) {
    	try {
    		PreparedStatement preparedStatement =connection.prepareStatement("delete from hotel_phones where hotel_id=? and phone=?");
    		preparedStatement.setInt(1,hotel_id);
    		preparedStatement.setLong(2,phone);
    		preparedStatement.executeUpdate();
    		return true;
    		    				
    	}
    	catch(SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
    
    
    public Hotels getHotelById(int hotel_id) {
        Hotels hotel = new Hotels();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select * from hotel where hotel_id=?");
            preparedStatement.setInt(1,hotel_id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
            	 hotel.setHotelid(rs.getInt("hotel_id"));
                 hotel.setHotelgroupid(rs.getInt("hotel_group_id"));
                 hotel.setname(rs.getString("name"));
                 hotel.setstars(rs.getInt("stars"));
                 hotel.setnumberofrooms(rs.getInt("number_of_rooms"));
                 hotel.setStreet(rs.getString("street"));
                 hotel.setpostalcode(rs.getInt("postal_code"));
                 hotel.setnum(rs.getInt("num"));
                 hotel.setCity(rs.getString("city"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return hotel;
    }
}
