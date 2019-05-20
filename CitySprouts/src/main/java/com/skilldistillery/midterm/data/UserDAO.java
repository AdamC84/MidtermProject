package com.skilldistillery.midterm.data;


import java.util.List;

import com.skilldistillery.midterm.entities.Address;
import com.skilldistillery.midterm.entities.Buyer;
import com.skilldistillery.midterm.entities.Driver;
import com.skilldistillery.midterm.entities.Seller;
import com.skilldistillery.midterm.entities.User;

public interface UserDAO {
	
	public User getUserById(int id);
	public User addUser(User u);
	public User updateUser(User u);
	public User deleteUser(User u);
	public List<User> getAllUsers();
	public User getUserByEmail(String email);
	public List<User> getUserByRole(String role);
	public User getUserByUserName(String userName);
	public List<User> getUserByKeyword(String keyword);
	
	public Driver getDriverById(int id);
	public Driver addDriver(Driver d);
	public Driver updateDriver(Driver d);
	public Driver deleteDriver(Driver d);
	public List<Driver> getAllDrivers();
	public Driver getDriverByBankAcctNum(String bankAcctNum);
	public List<Driver> getDriverByBankName(String bankName);
	public Driver getDriverByBankRouting(String bankRouting);
	
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
	public Seller getSellerByBankRouting(String bankRouting);
	public Seller getSellerByBankAcctNum(String bankAcctNum);
	public List<Seller> getSellerByBankName(String bankName);
	
	public User getUserByCity(String city);
	public User getUserByState(String state);
	public User login(String u, String p);
	
	public Address getAddressByUserId(int id);
	public Address getAddressBySellerId(int id);
	public Address getAddressByBuyerId(int id);
	public Address getAddressByDriverId(int id);
	public Address addAddress(Address a);
	public Address updateAddress(Address a);
	public Address deleteAddress(Address a);
	Seller getSellerByUserId(int id);
	
}
