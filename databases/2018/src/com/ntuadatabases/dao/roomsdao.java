package com.ntuadatabases.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.lang.String;
import com.ntuadatabases.model.Rooms;
import com.ntua.databases.Connector;
import java.io.*;
import static java.lang.System.out;

public class roomsdao {

	private Connection connection;

	public roomsdao() {
		connection = Connector.grabConnection();
	}

	public boolean addRoom(Rooms room) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"insert into hotel_room(hotel_id,price,repairs_needed,expandable,view,capacity) values (?, ?, ?, ?, ?, ? )");
			// Parameters start with 1
			preparedStatement.setInt(1, room.gethotelid());
			preparedStatement.setFloat(2, room.getprice());
			preparedStatement.setInt(3, room.getrepairsneeded());
			preparedStatement.setInt(4, room.getexpandable());
			preparedStatement.setInt(5, room.getview());
			preparedStatement.setInt(6, room.getcapacity());
			preparedStatement.executeUpdate();
			return true;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteRoom(int room_id) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("delete from hotel_room where room_id=?");
			// Parameters start with 1
			preparedStatement.setInt(1, room_id);
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateRoom(Rooms room) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"update hotel_room set hotel_id=?,price =?, repairs_needed=?, expandable=?, view=?, capacity=? where room_id=?");
			// Parameters start with 1
			preparedStatement.setInt(1, room.gethotelid());
			preparedStatement.setFloat(2, room.getprice());
			preparedStatement.setInt(3, room.getrepairsneeded());
			preparedStatement.setInt(4, room.getexpandable());
			preparedStatement.setInt(5, room.getview());
			preparedStatement.setInt(6, room.getcapacity());
			preparedStatement.setInt(7, room.getroomid());
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<Rooms> getAllRooms() {
		List<Rooms> rooms = new ArrayList<Rooms>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from hotel_room");
			while (rs.next()) {
				Rooms room = new Rooms();
				room.setroomid(rs.getInt("room_id"));
				room.sethotelid(rs.getInt("hotel_id"));
				room.setprice(rs.getFloat("price"));
				room.setrepairsneeded(rs.getInt("repairs_needed"));
				room.setexpandable(rs.getInt("expandable"));
				room.setview(rs.getInt("view"));
				room.setcapacity(rs.getInt("capacity"));

				rooms.add(room);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return rooms;
	}

	public List<String> getAllAmenities(int room_id) {
		List<String> amenities = new ArrayList<String>();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"select hotel_room_amenities.room_id,amenities.amenity from hotel_room_amenities inner join amenities on hotel_room_amenities.amenity_id=amenities.amenity_id where room_id=?");
			preparedStatement.setInt(1, room_id);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				String s = rs.getString("amenity");
				amenities.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return amenities;

	}

	public boolean addamenity(int room_id, String amenity) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select amenity_id from amenities where amenity=?");
			preparedStatement.setString(1, amenity);
			ResultSet rs = preparedStatement.executeQuery();
			int amenity_id = 0;
			if (rs.next()) {
				amenity_id = rs.getInt("amenity_id");
			}
			PreparedStatement preparedStatement2 = connection
					.prepareStatement("insert into hotel_room_amenities(room_id,amenity_id) values (?, ?)");
			preparedStatement2.setInt(1, room_id);
			preparedStatement2.setInt(2, amenity_id);
			preparedStatement2.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	public boolean deleteamenity(int room_id, String amenity) {
		try {

			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from amenities where amenity=?");
			preparedStatement.setString(1, amenity);
			ResultSet rs = preparedStatement.executeQuery();
			int amenity_id = 0;
			if (rs.next()) {
				amenity_id = rs.getInt("amenity_id");
			}
			PreparedStatement preparedStatement2 = connection
					.prepareStatement("delete from hotel_room_amenities where (room_id=? and amenity_id=?)");
			preparedStatement2.setInt(1, room_id);
			preparedStatement2.setInt(2, amenity_id);
			preparedStatement2.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	public Rooms getRoomById(int room_id) {
		Rooms room = new Rooms();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from hotel_room where room_id=?");
			preparedStatement.setInt(1, room_id);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				room.setroomid(rs.getInt("room_id"));
				room.sethotelid(rs.getInt("hotel_id"));
				room.setprice(rs.getFloat("price"));
				room.setrepairsneeded(rs.getInt("repairs_needed"));
				room.setexpandable(rs.getInt("expandable"));
				room.setview(rs.getInt("view"));
				room.setcapacity(rs.getInt("capacity"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return room;
	}
}
