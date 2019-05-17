package com.skilldistillery.midterm.data;

import java.util.List;

import com.mysql.cj.jdbc.Driver;
import com.skilldistillery.midterm.entities.Buyer;
import com.skilldistillery.midterm.entities.Item;
import com.skilldistillery.midterm.entities.Seller;
import com.skilldistillery.midterm.entities.User;

public interface SproutsDAO {

	public Driver getDriverById(int id);
	public List<Driver> getAllDrivers();
	public List<Seller> getAllSellers();
	public List<Buyer> getAllBuyers();
	public Seller getSellerById(int id);
	public Buyer getBuyerById(int id);
	public List<Item> getItemsByCategoryId(int id);
	List<User> getAllUsers();
	
}
