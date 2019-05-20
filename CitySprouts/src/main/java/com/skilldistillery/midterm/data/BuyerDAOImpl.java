package com.skilldistillery.midterm.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.midterm.entities.Buyer;
import com.skilldistillery.midterm.entities.Item;
import com.skilldistillery.midterm.entities.Purchase;

@Transactional
@Service
public class BuyerDAOImpl implements BuyerDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Purchase> getAllPurchases(Buyer buyer) {
		int buyerId = buyer.getId();
		String query = "Select p from Purchase p WHERE p.buyer.id = :buyerId";
		List<Purchase> purchases = em.createQuery(query, Purchase.class).setParameter("buyerId", buyerId).getResultList();
		return purchases;
	}

	@Override
	public Purchase getPurchase(int id) {
		String query = "Select p from Purchase p WHERE p.id = :id";
		Purchase purchase = em.createQuery(query, Purchase.class).setParameter("id",  id).getResultList().get(0);
		return purchase;
	}
}
