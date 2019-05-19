 package com.skilldistillery.midterm.data;
 
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.midterm.entities.Address;
import com.skilldistillery.midterm.entities.Buyer;
import com.skilldistillery.midterm.entities.Driver;
import com.skilldistillery.midterm.entities.Seller;
import com.skilldistillery.midterm.entities.User;

@Transactional
@Service
public class UserDAOImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User getUserById(int id) {
		User user = em.find(User.class, id);
		return user;
	}
	@Override
	public Driver getDriverById(int id) {
		Driver driver = em.find(Driver.class, id);
		return driver;
	}

	@Override
	public List<Driver> getAllDrivers() {
		String query = "Select driver from Driver driver";
		List<Driver> drivers= em.createQuery(query, Driver.class).getResultList();
		return drivers;
	}
	@Override
	public List<User> getAllUsers() {
		String query = "Select user from User user";
		List<User> users = em.createQuery(query, User.class).getResultList();
		return users;
	}

	@Override
	public List<Seller> getAllSellers() {
		String query = "Select seller from Seller seller";
		List<Seller> sellers = em.createQuery(query, Seller.class).getResultList();
		return sellers;
	}

	@Override
	public List<Buyer> getAllBuyers() {
		String query = "Select buyer from Buyer buyer";
		List<Buyer> buyers = em.createQuery(query, Buyer.class).getResultList();
		return buyers;
	}

	@Override
	public Seller getSellerById(int id) {
		Seller seller = em.find(Seller.class, id);
		return seller;
	}

	@Override
	public Buyer getBuyerById(int id) {
		Buyer buyer = em.find(Buyer.class, id);
		return buyer;
	}

	@Override
	public User addUser(User u) {
		u.setCreateTime(new Date());
		u.setLastLogin(new Date());
		em.persist(u);
		
		em.flush();
		return u;
	}

	@Override
	public User updateUser(User u) {
		User updatedUser = em.find(User.class, u.getId());
		updatedUser.setFirstName(u.getFirstName());
		updatedUser.setLastName(u.getLastName());
		updatedUser.setEmail(u.getEmail());
		updatedUser.setPassword(u.getPassword());
		updatedUser.setUsername(u.getUsername());
		updatedUser.setRole(u.getRole());
		em.persist(updatedUser);
		return updatedUser;
	}
	
	public User getUserByEmail(String email){
		String queryString = "SELECT user FROM User user WHERE user.email = :email";
		User user = em.createQuery(queryString, User.class).setParameter("email", email).getResultList().get(0);
		return user;
	}
	public List<User> getUserByRole(String role){
		String queryString = "SELECT user FROM User user WHERE user.role = :role";
		List<User> users = em.createQuery(queryString, User.class).setParameter("role", role).getResultList();
		return users;
	}
	public User getUserByUserName(String userName){
		String queryString = "SELECT user FROM User user WHERE user.userName = :userName";
		User user = em.createQuery(queryString, User.class).setParameter("userName", userName).getResultList().get(0);
		return user;
	}
	public List<User> getUserByKeyword(String keyword){
		String queryString = "SELECT user FROM User user WHERE user.firstName LIKE :keyword OR user.lastName LIKE :keyword";
		List<User> users = em.createQuery(queryString, User.class).setParameter("keyword", "%" + keyword + "%").getResultList();
		return users;
	}

	@Override
	public User deleteUser(User u) {
		em.remove(u);
		em.flush();
		return u;
	}

	@Override
	public Driver addDriver(Driver d) {
		em.persist(d);
		em.flush();
		return d;
	}

	@Override
	public Driver updateDriver(Driver d) {
		Driver updatedDriver= em.find(Driver.class, d.getId());
		updatedDriver.setBankAcctNum(d.getBankAcctNum());
		updatedDriver.setBankName(d.getBankName());
		updatedDriver.setBankRouting(d.getBankRouting());
		updatedDriver.setDriver(em.find(User.class, d.getUser().getId()));
		updatedDriver.setAddressId(d.getAddressId());
		em.persist(updatedDriver);
		em.flush();
		return updatedDriver;
	}
	public Driver getDriverByBankAcctNum(String bankAcctNum){
		String queryString = "SELECT driver FROM Driver driver WHERE driver.bankAcctNum = :bankAcctNum";
		Driver driver = em.createQuery(queryString, Driver.class).setParameter("bankAcctNum", bankAcctNum).getResultList().get(0);
		return driver;
	}
	public List<Driver> getDriverByBankName(String bankName){
		String queryString = "SELECT driver FROM Driver driver WHERE driver.bankName = :bankName";
		List<Driver> drivers = em.createQuery(queryString, Driver.class).setParameter("bankName", bankName).getResultList();
		return drivers;
	}
	public Driver getDriverByBankRouting(String bankRouting){
		String queryString = "SELECT driver FROM Driver driver WHERE driver.bankRouting = :bankRouting";
		Driver driver = em.createQuery(queryString, Driver.class).setParameter("bankRouting", bankRouting).getResultList().get(0);
		return driver;
	}
	

	@Override
	public Driver deleteDriver(Driver d) {
		em.remove(d);
		em.flush();
		return d;
	}

	@Override
	public Buyer addBuyer(Buyer b) {
		em.persist(b);
		em.flush();
		return b;
	}

	@Override
	public Buyer updateBuyer(Buyer b) {
		Buyer updatedBuyer = em.find(Buyer.class, b.getId());
		updatedBuyer.setCreditCardCcv(b.getCreditCardCcv());
		updatedBuyer.setCreditCardExpDate(b.getCreditCardExpDate());
		updatedBuyer.setCreditCardNum(b.getCreditCardNum());
		updatedBuyer.setUser(em.find(User.class, b.getId()));
		em.persist(updatedBuyer);
		em.flush();
		return updatedBuyer;
	}
	

	@Override
	public Buyer deleteBuyer(Buyer b) {
		em.remove(b);
		em.flush();
		return b;
	}

	@Override
	public Seller addSeller(Seller s) {
		em.persist(s);
		em.flush();
		return s;
	}
	public Seller getSellerByBankRouting(String bankRouting){
		String queryString = "SELECT seller.bankRouting FROM Seller seller WHERE seller.bankRouting = :bankRouting";
		Seller seller = em.createQuery(queryString, Seller.class).setParameter("bankRouting", bankRouting).getResultList().get(0);
		return seller;
	}
	public Seller getSellerByBankAcctNum(String bankAcctNum){
		String queryString = "SELECT seller.bankAcctNum FROM Seller seller WHERE seller.bankAcctNum = :bankAcctNum";
		Seller seller = em.createQuery(queryString, Seller.class).setParameter("bankAcctNum", bankAcctNum).getResultList().get(0);
		return seller;
	}
	public List<Seller> getSellerByBankName(String bankName){
		String queryString = "SELECT seller.bankName FROM Seller seller WHERE seller.bankName = :bankName";
		List<Seller> sellers = em.createQuery(queryString, Seller.class).setParameter("bankName", bankName).getResultList();
		return sellers;
	}

	@Override
	public Seller updateSeller(Seller s) {
		Seller updatedSeller = em.find(Seller.class, s.getId());
		updatedSeller.setBankAcctNum(s.getBankAcctNum());
		updatedSeller.setBankName(s.getBankName());
		updatedSeller.setBankRouting(s.getBankRouting());
		updatedSeller.setUser(em.find(User.class, s.getId()));
		em.persist(updatedSeller);
		em.flush();
		return updatedSeller;
	}

	@Override
	public Seller deleteSeller(Seller s) {
		em.remove(s);
		em.flush();
		return s;
	}
	@Override
	public User getUserByCity(String city) {
		String query = "Select u from User u where u.address.city = :city";
		List<User> user = em.createQuery(query,User.class).setParameter("city", city).getResultList();
		return user.get(0);
	}
	@Override
	public User getUserByState(String state) {
		String query = "Select u from User u where u.address.state = :state";
		List<User> user = em.createQuery(query,User.class).setParameter("state", state).getResultList();
		return user.get(0);
	}
	@Override
	public Address getAddressByUserId(int id) {
		String query = "Select u.address from User u where user.id = :id";
		List<Address> address = em.createQuery(query,Address.class).setParameter("id", id).getResultList();
		return address.get(0);
	}
	@Override
	public Address getAddressBySellerId(int id) {
		String query = "Select u.address from User u where u.seller.id = :id";
		List<Address> address = em.createQuery(query, Address.class).setParameter("id", id).getResultList();
		return address.get(0);
	}
	@Override
	public Address getAddressByBuyerId(int id) {
		String query = "Select u.address from User u where u.buyer.id = :id";
		List<Address> address = em.createQuery(query,Address.class).setParameter("id", id).getResultList();
		return address.get(0);
	}
	@Override
	public Address getAddressByDriverId(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Address addAddress(Address aa) {
		Address a = new Address();
		a.setStreetAddress(aa.getStreetAddress());
		a.setAddress2(aa.getAddress2());
		a.setCity(aa.getCity());
		a.setState(aa.getState());
		a.setZipcode(aa.getZipcode());
		em.persist(a);
		em.flush();
		return a;
	}
	@Override
	public Address updateAddress(Address address) {
		Address a = em.find(Address.class, address.getId());
		a.setStreetAddress(address.getStreetAddress());
		a.setAddress2(address.getAddress2());
		a.setCity(address.getCity());
		a.setState(address.getState());
		a.setZipcode(address.getZipcode());
		em.persist(a);
		em.flush();
		return null;
	}
	@Override
	public Address deleteAddress(Address a) {
		em.remove(a);
		em.flush();
		return a;
	}
	
	public User login(String username, String password) {
		User user = null;
		String query = "Select u from User u where username = :username and password = :password";
		 user = em.createQuery(query, User.class).setParameter("username", username).setParameter("password", password).getResultList().get(0);
		
		return user;
	}

	
}
	