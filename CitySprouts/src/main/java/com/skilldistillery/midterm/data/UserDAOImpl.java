 package com.skilldistillery.midterm.data;
 
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
		em.persist(u);
		em.flush();
		return u;
	}

	@Override
	public User updateUser(int id, User u) {
		User updatedUser = em.find(User.class, id);
		updatedUser.setFirstName(u.getFirstName());
		updatedUser.setLastName(u.getLastName());
		updatedUser.setEmail(u.getEmail());
		updatedUser.setPassword(u.getPassword());
		updatedUser.setUsername(u.getUsername());
		updatedUser.setRole(u.getRole());
		return updatedUser;
	}
	public User getUserByEmail(String email){
		String queryString = "SELECT user.email FROM User user WHERE user.email = :email";
		User user = em.createQuery(queryString, User.class).setParameter("email", email).getResultList().get(0);
		return user;
	}
	public List<User> getUserByRole(String role){
		String queryString = "SELECT user.role FROM User user WHERE user.role = :role";
		List<User> users = em.createQuery(queryString, User.class).setParameter("role", role).getResultList();
		return users;
	}
	public User getUserByUserName(String userName){
		String queryString = "SELECT user.userName FROM User user WHERE user.userName = :userName";
		User user = em.createQuery(queryString, User.class).setParameter("userName", userName).getResultList().get(0);
		return user;
	}
	public List<User> getUserByKeyword(String keyword){
		String queryString = "SELECT user FROM User user WHERE user.firstName LIKE :keyword OR user.lastName LIKE :keyword";
		List<User> users = em.createQuery(queryString, User.class).setParameter("keyword", keyword).getResultList();
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
	public Driver updateDriver(int id, Driver d) {
		Driver updatedDriver= em.find(Driver.class, id);
		updatedDriver.setBankAcctNum(d.getBankAcctNum());
		updatedDriver.setBankName(d.getBankName());
		updatedDriver.setBankRouting(d.getBankRouting());
		updatedDriver.setDriver(em.find(User.class, d.getUser().getId()));
		updatedDriver.setAddressId(d.getAddressId());
		return updatedDriver;
	}
	public Driver getDriverByBankAcctNum(String bankAcctNum){
		String queryString = "SELECT driver.bankAcctNum FROM Driver driver WHERE driver.bankAcctNum = :bankAcctNum";
		Driver driver = em.createQuery(queryString, Driver.class).setParameter("bankAcctNum", bankAcctNum).getResultList().get(0);
		return driver;
	}
	public List<Driver> getDriverByBankName(String bankName){
		String queryString = "SELECT driver.bankName FROM Driver driver WHERE driver.bankName = :bankName";
		List<Driver> drivers = em.createQuery(queryString, Driver.class).setParameter("bankName", bankName).getResultList();
		return drivers;
	}
	public Driver getDriverByBankRouting(String bankRouting){
		String queryString = "SELECT driver.bankRouting FROM Driver driver WHERE driver.bankRouting = :bankRouting";
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
	public Buyer updateBuyer(int id, Buyer b) {
		Buyer updatedBuyer = em.find(Buyer.class, id);
		updatedBuyer.setAddress(b.getAddress());
		updatedBuyer.setCreditCardCcv(b.getCreditCardCcv());
		updatedBuyer.setCreditCardExpDate(b.getCreditCardExpDate());
		updatedBuyer.setCreditCardNum(b.getCreditCardNum());
		updatedBuyer.setUser(em.find(User.class, b.getId()));
		return updatedBuyer;
	}
	public Buyer getBuyerByBankRouting(String bankRouting){
		String queryString = "SELECT buyer.bankRouting FROM Buyer buyer WHERE buyer.bankRouting = :bankRouting";
		Buyer buyer = em.createQuery(queryString, Buyer.class).setParameter("bankRouting", bankRouting).getResultList().get(0);
		return buyer;
	}
	public Buyer getBuyerByBankAcctNum(String bankAcctNum){
		String queryString = "SELECT buyer.bankAcctNum FROM Buyer buyer WHERE buyer.bankAcctNum = :bankAcctNum";
		Buyer buyer = em.createQuery(queryString, Buyer.class).setParameter("bankAcctNum", bankAcctNum).getResultList().get(0);
		return buyer;
	}
	public List<Buyer> getBuyerByBankName(String bankName){
		String queryString = "SELECT buyer.bankName FROM Buyer buyer WHERE buyer.bankName = :bankName";
		List<Buyer> buyers = em.createQuery(queryString, Buyer.class).setParameter("bankName", bankName).getResultList();
		return buyers;
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
	public Seller updateSeller(int id, Seller s) {
		Seller updatedSeller = em.find(Seller.class, id);
		updatedSeller.setAddress(s.getAddress());
		updatedSeller.setBankAcctNum(s.getBankAcctNum());
		updatedSeller.setBankName(s.getBankName());
		updatedSeller.setBankRouting(s.getBankRouting());
		updatedSeller.setUser(em.find(User.class, s.getId()));
		return null;
	}

	@Override
	public Seller deleteSeller(Seller s) {
		em.remove(s);
		em.flush();
		return s;
	}

	
}
	