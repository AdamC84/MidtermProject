 package com.skilldistillery.midterm.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.mysql.cj.jdbc.Driver;
import com.skilldistillery.midterm.entities.Buyer;
import com.skilldistillery.midterm.entities.Item;
import com.skilldistillery.midterm.entities.Seller;
import com.skilldistillery.midterm.entities.User;

@Transactional
@Service
public class SproutsDAOImpl implements SproutsDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Driver getDriverById(int id) {
		Driver driver = em.find(Driver.class, id);
		return driver;
	}

	@Override
	public List<Driver> getAllDrivers() {
		String query = "Select driver from Driver driver";
		List<Driver> drivers = em.createQuery(query, Driver.class).getResultList();
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
	public List<Item> getItemsByCategoryId(int id) {
		String query = "Select item from Item item where item.category_id = :id";
		List<Item> items = em.createQuery(query, Item.class).setParameter("id", id).getResultList();
		return items;
	}
	
	

}
