package com.ntuadatabases.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.ntua.databases.Connector;
import com.ntuadatabases.model.Hotelgroups;

public class hotelgroupsdao {
	
	private Connection connection;

    public hotelgroupsdao() {
        connection = Connector.grabConnection();
    }

    public boolean addHotelgroup(Hotelgroups hotelgroup) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into hotel_group(name,number_of_hotels,street,num,postal_code,city) values (?, 0, ?, ?, ?, ? )");
            // Parameters start with 1
            preparedStatement.setString(1, hotelgroup.getname());
            preparedStatement.setString(2,hotelgroup.getStreet());
            preparedStatement.setInt(3, hotelgroup.getnum());
            preparedStatement.setInt(4, hotelgroup.getpostalcode());
            preparedStatement.setString(5, hotelgroup.getCity());
            preparedStatement.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteHotelgroup(int hotel_group_id) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from hotel_group where hotel_group_id=?");
            // Parameters start with 1
            preparedStatement.setInt(1, hotel_group_id);
            preparedStatement.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateHotelgroup(Hotelgroups hotelgroup) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update hotel_group set name=?, street=?, num=?, postal_code=?, city=?" +
                            "where hotel_group_id=?");
            // Parameters start with 1
            preparedStatement.setString(1, hotelgroup.getname());
            preparedStatement.setString(2,hotelgroup.getStreet());
            preparedStatement.setInt(3, hotelgroup.getnum());
            preparedStatement.setInt(4, hotelgroup.getpostalcode());
            preparedStatement.setString(5, hotelgroup.getCity());
            preparedStatement.setInt(6, hotelgroup.getHotelgroupid());
            preparedStatement.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Hotelgroups> getAllHotelgroups() {
        List<Hotelgroups> hotelgroups = new ArrayList<Hotelgroups>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from hotel_group");
            while (rs.next()) {
                Hotelgroups hotelgroup = new Hotelgroups();
                hotelgroup.setHotelgroupid(rs.getInt("hotel_group_id"));
                hotelgroup.setname(rs.getString("name"));
                hotelgroup.setnumberofhotels(rs.getInt("number_of_hotels"));
                hotelgroup.setStreet(rs.getString("street"));
                hotelgroup.setnum(rs.getInt("num"));
                hotelgroup.setpostalcode(rs.getInt("postal_code"));
                hotelgroup.setCity(rs.getString("city"));
                hotelgroups.add(hotelgroup);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return hotelgroups;
    }
    
    public List<String> getAllMails(int hotel_group_id) {
    	List<String> emails=new ArrayList<String>();
    	try {
    			PreparedStatement preparedStatement=connection.prepareStatement("select * from hotel_group_emails where hotel_group_id=?");
    			preparedStatement.setInt(1,hotel_group_id);
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
    public boolean addmail(int hotel_group_id,String mail) {
    	try {
    		PreparedStatement preparedStatement =connection.prepareStatement("insert into hotel_group_emails(hotel_group_id,email) values (?, ?)");
    		preparedStatement.setInt(1,hotel_group_id);
    		preparedStatement.setString(2,mail);
    		preparedStatement.executeUpdate();
    		return true;
    		
    	}
    	catch(SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
    public boolean deletemail(int hotel_group_id,String mail) {
    	try {
    		PreparedStatement preparedStatement =connection.prepareStatement("delete from hotel_group_emails where hotel_group_id=? and email=?");
    		preparedStatement.setInt(1,hotel_group_id);
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
    
    public List<Long> getAllPhones(int hotel_group_id) {
    	List<Long> phones=new ArrayList<Long>();
    	try {
    			PreparedStatement preparedStatement=connection.prepareStatement("select * from hotel_group_phones where hotel_group_id=?");
    			preparedStatement.setInt(1,hotel_group_id);
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
    public boolean addphone(int hotel_group_id,long phone) {
    	try {
    		PreparedStatement preparedStatement =connection.prepareStatement("insert into hotel_group_phones(hotel_group_id,phone) values (?, ?)");
    		preparedStatement.setInt(1,hotel_group_id);
    		preparedStatement.setLong(2,phone);
    		preparedStatement.executeUpdate();
    		return true;
    		
    	}
    	catch(SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
    public boolean deletephone(int hotel_group_id,long phone) {
    	try {
    		PreparedStatement preparedStatement =connection.prepareStatement("delete from hotel_group_phones where hotel_group_id=? and phone=?");
    		preparedStatement.setInt(1,hotel_group_id);
    		preparedStatement.setLong(2,phone);
    		preparedStatement.executeUpdate();
    		return true;
    		    		
    		    				
    	}
    	catch(SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }

    public Hotelgroups getHotelgroupById(int hotel_group_id) {
        Hotelgroups hotelgroup = new Hotelgroups();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select * from hotel_group where hotel_group_id=?");
            preparedStatement.setInt(1,hotel_group_id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
            	hotelgroup.setHotelgroupid(rs.getInt("hotel_group_id"));
            	hotelgroup.setname(rs.getString("name"));
                hotelgroup.setnumberofhotels(rs.getInt("number_of_hotels"));
                hotelgroup.setStreet(rs.getString("street"));
                hotelgroup.setnum(rs.getInt("num"));
                hotelgroup.setpostalcode(rs.getInt("postal_code"));
                hotelgroup.setCity(rs.getString("city"));
            	
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return hotelgroup;
    }

}
