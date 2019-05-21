package com.skilldistillery.midterm.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.midterm.entities.Purchase;
import com.skilldistillery.midterm.entities.Seller;

@Transactional
@Service
public class SellerDAOImpl implements SellerDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Purchase> getAllOrders(Seller seller) {
		int sellerId = seller.getId();
		String query = "Select p from Purchase p WHERE inventory.sellerId = :sellerId";
		List<Purchase> orders = em.createQuery(query, Purchase.class).setParameter("sellerId", sellerId).getResultList();
		return orders;
	}

	@Override
	public Purchase getOrder(int oId) {
		String query = "Select p from Purchase p WHERE p.Id = :oId";
		Purchase purchase = em.createQuery(query, Purchase.class).setParameter("oId",  oId).getResultList().get(0);
		return purchase;
	}

	@Override
	public List<Object[]> getInventoryItemsQtyBySeller(int sId) {
		String query = "Select i.item.id, i.item.name, count(distinct i.item.id) from Inventory i WHERE i.seller.id = :sId GROUP BY i.item.id";
		
		List<Object[]> invSummary = em.createQuery(query, Object[].class)
				.setParameter("sId", sId)
				.getResultList();
		
		System.out.println("impl query: *************" + invSummary);
		
		return invSummary;
	}
	
	

}
