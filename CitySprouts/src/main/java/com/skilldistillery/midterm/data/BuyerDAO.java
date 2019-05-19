package com.skilldistillery.midterm.data;

import java.util.List;

import com.skilldistillery.midterm.entities.Buyer;
import com.skilldistillery.midterm.entities.Purchase;

public interface BuyerDAO {

	public List<Purchase> getAllPurchases(Buyer buyer);
	public Purchase getPurchase(Buyer buyer, int id);
	
	
	
}
