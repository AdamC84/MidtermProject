package com.skilldistillery.midterm.data;

import java.util.List;

import com.mysql.cj.jdbc.Driver;
import com.skilldistillery.midterm.entities.Buyer;
import com.skilldistillery.midterm.entities.Item;
import com.skilldistillery.midterm.entities.Seller;
import com.skilldistillery.midterm.entities.User;

public interface UserDAO {
	
	public User getUserById(int id);
	public User addUser(User u);
	public User updateUser(User u);
	public User deleteUser(User u);
	public List<User> getAllUsers();
	
	public Driver getDriverById(int id);
	public Driver addDriver(Driver d);
	public Driver updateDriver(Driver d);
	public Driver deleteDriver(Driver d);
	public List<Driver> getAllDrivers();
	
	public Buyer addBuyer(Buyer b);
	public Buyer updateBuyer(Buyer b);
	public Buyer deleteBuyer(Buyer b);
	public Buyer getBuyerById(int id);
	public List<Buyer> getAllBuyers();
	
	public Seller addSeller(Seller s);
	public Seller updateSeller(Seller s);
	public Seller deleteSeller(Seller s);
	public Seller getSellerById(int id);
	public List<Seller> getAllSellers();
	
	
}
