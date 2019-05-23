package com.skilldistillery.midterm.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.midterm.entities.Item;
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
	public List<Object[]> getPendingInventoryItemsQtyBySeller(int sId) {
		String query = "Select i.item.id, i.item.name, count( i.item.id) from Inventory i WHERE i.seller.id = :sId And i.purchase is null GROUP BY i.item.id";
		
		List<Object[]> invSummary = em.createQuery(query, Object[].class).setParameter("sId", sId).getResultList();
		System.out.println("impl query: *************" + invSummary);
		
		
		return invSummary;
	}
	@Override
	public List<Object[]> getFulfilledInventoryItemsQtyBySeller(int sId) {
		String query = "Select i.item.id, i.item.name, count( i.item.id) from Inventory i WHERE i.seller.id = :sId And i.purchase.purchaseStatus.id = 4 GROUP BY i.item.id";
		
		List<Object[]> invSummary = em.createQuery(query, Object[].class).setParameter("sId", sId).getResultList();
		System.out.println("impl query: *************" + invSummary);
		
		
		return invSummary;
	}


	@Override
	public List<Item> getInventoryItemsBySellerId(int sId) {
		String query = "Select i from Item i WHERE i.seller.id = :sId";
		
		List<Item> invSummary = em.createQuery(query, Item.class)
				.setParameter("sId", sId)
				.getResultList();
		
		System.out.println("impl query: *************" + invSummary);
		
		return invSummary;
	}
	
	
	

}
