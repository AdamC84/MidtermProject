package com.skilldistillery.midterm.data;


import java.util.List;

import com.skilldistillery.midterm.entities.Buyer;
import com.skilldistillery.midterm.entities.Driver;
import com.skilldistillery.midterm.entities.Item;
import com.skilldistillery.midterm.entities.Seller;
import com.skilldistillery.midterm.entities.User;

public interface UserDAO {
	
	public User getUserById(int id);
	public User addUser(User u);
	public User updateUser(int id, User u);
	public User deleteUser(User u);
	public List<User> getAllUsers();
	public User getUserByEmail(String email);
	public List<User> getUserByRole(String role);
	public User getUserByUserName(String userName);
	public List<User> getUserByKeyword(String keyword);
	
	public Driver getDriverById(int id);
	public Driver addDriver(Driver d);
	public Driver updateDriver(int id,Driver d);
	public Driver deleteDriver(Driver d);
	public List<Driver> getAllDrivers();
	public Driver getDriverByBankAcctNum(String bankAcctNum);
	public List<Driver> getDriverByBankName(String bankName);
	public Driver getDriverByBankRouting(String bankRouting);
	
	public Buyer addBuyer(Buyer b);
	public Buyer updateBuyer(int id, Buyer b);
	public Buyer deleteBuyer(Buyer b);
	public Buyer getBuyerById(int id);
	public List<Buyer> getAllBuyers();
	public Buyer getBuyerByBankRouting(String bankRouting);
	public Buyer getBuyerByBankAcctNum(String bankAcctNum);
	public List<Buyer> getBuyerByBankName(String bankName);
	
	public Seller addSeller(Seller s);
	public Seller updateSeller(int id, Seller s);
	public Seller deleteSeller(Seller s);
	public Seller getSellerById(int id);
	public List<Seller> getAllSellers();
	public Seller getSellerByBankRouting(String bankRouting);
	public Seller getSellerByBankAcctNum(String bankAcctNum);
	public List<Seller> getSellerByBankName(String bankName);
	
	
}
