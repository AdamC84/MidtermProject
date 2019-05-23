package com.skilldistillery.midterm.data;

import java.util.List;

import com.skilldistillery.midterm.entities.Item;
import com.skilldistillery.midterm.entities.Purchase;
import com.skilldistillery.midterm.entities.Seller;

public interface SellerDAO {

	public List<Purchase> getAllOrders(Seller seller);
	public Purchase getOrder(int oId);
	public List<Object[]> getPendingInventoryItemsQtyBySeller(int sId);
	List<Item> getInventoryItemsBySellerId(int sId);
	List<Object[]> getFulfilledInventoryItemsQtyBySeller(int sId);
	
	
	
}
