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
		em.getTransaction().begin();
		em.persist(u);
		em.flush();
		em.getTransaction().commit();
		em.close();
		return u;
	}

	@Override
	public User updateUser(int id, User u) {
		em.getTransaction().begin();
		User updatedUser = em.find(User.class, id);
		updatedUser.setFirstName(u.getFirstName());
		updatedUser.setLastName(u.getLastName());
		updatedUser.setEmail(u.getEmail());
		updatedUser.setPassword(u.getPassword());
		updatedUser.setUsername(u.getUsername());
		updatedUser.setRole(u.getRole());
		em.getTransaction().commit();
		em.close();
		return updatedUser;
	}

	@Override
	public User deleteUser(User u) {
		em.getTransaction().begin();
		em.remove(u);
		em.flush();
		em.getTransaction().commit();
		return null;
	}

	@Override
	public Driver addDriver(Driver d) {
		em.getTransaction().begin();
		em.persist(d);
		em.flush();
		em.getTransaction().commit();
		em.close();		
		return null;
	}

	@Override
	public Driver updateDriver(int id, Driver d) {
		em.getTransaction().begin();
		Driver updatedDriver= em.find(Driver.class, id);
		updatedDriver.setBankAcctNum(d.getBankAcctNum());
		updatedDriver.setBankName(d.getBankName());
		updatedDriver.setBankRouting(d.getBankRouting());
		updatedDriver.setDriver(em.find(User.class, d.getUser().getId()));
		updatedDriver.setAddressId(d.getAddressId());
		em.getTransaction().commit();
		em.close();
		return updatedDriver;
	}

	@Override
	public Driver deleteDriver(Driver d) {
		em.getTransaction().begin();
		em.remove(d);
		em.flush();
		em.getTransaction().commit();
		return null;
	}

	@Override
	public Buyer addBuyer(Buyer b) {
		em.getTransaction().begin();
		em.persist(b);
		em.flush();
		em.getTransaction().commit();
		em.close();
		return b;
	}

	@Override
	public Buyer updateBuyer(int id, Buyer b) {
		em.getTransaction().begin();
		Buyer updatedBuyer = em.find(Buyer.class, id);
		updatedBuyer.setAddress(b.getAddress());
		updatedBuyer.setCreditCardCcv(b.getCreditCardCcv());
		updatedBuyer.setCreditCardExpDate(b.getCreditCardExpDate());
		updatedBuyer.setCreditCardNum(b.getCreditCardNum());
		updatedBuyer.setUser(em.find(User.class, b.getId()));
		em.getTransaction().commit();
		em.close();
		return updatedBuyer;
	}

	@Override
	public Buyer deleteBuyer(Buyer b) {
		em.getTransaction().begin();
		em.remove(b);
		em.flush();
		em.getTransaction().commit();
		return null;
	}

	@Override
	public Seller addSeller(Seller s) {
		em.getTransaction().begin();
		em.persist(s);
		em.flush();
		em.getTransaction().commit();
		em.close();
		return null;
	}

	@Override
	public Seller updateSeller(int id, Seller s) {
		em.getTransaction().begin();
		Seller updatedSeller = em.find(Seller.class, id);
		updatedSeller.setAddress(s.getAddress());
		updatedSeller.setBankAcctNum(s.getBankAcctNum());
		updatedSeller.setBankName(s.getBankName());
		updatedSeller.setBankRouting(s.getBankRouting());
		updatedSeller.setUser(em.find(User.class, s.getId()));
		em.getTransaction().commit();
		em.close();
		return null;
	}

	@Override
	public Seller deleteSeller(Seller s) {
		em.getTransaction().begin();
		em.remove(s);
		em.flush();
		em.getTransaction().commit();
		return null;
	}

	
}
	