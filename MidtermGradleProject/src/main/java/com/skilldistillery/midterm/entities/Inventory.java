package com.skilldistillery.midterm.entities;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Inventory {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name = "seller_id")
	private Seller seller;
	@ManyToOne
	@JoinColumn(name = "item_id")
	private Item item;
	
	@ManyToMany(mappedBy="inventoryItems",
			fetch = FetchType.EAGER)	
	private List<Purchase> purchases;
	
	public List<Purchase> getPurchases() {
		return purchases;
	}
	
	public void setPurchases(List<Purchase> purchases) {
		this.purchases = purchases;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void addPurchase(Purchase purchase) {
		if(purchases == null) {
			purchases = new ArrayList<>();
		}
		
		if (!purchases.contains(purchase)) {
			purchases.add(purchase);
			purchase.addInventoryItem(this);
		}
	}
	
	public void removePurchase(Purchase purchase) {
		if(purchases != null &&
				purchases.contains(purchase)) {
			purchases.remove(purchase);
			purchase.removeInventoryItem(this);
		}
	}

	public Inventory(int id, Seller seller, Item item) {
		super();
		this.id = id;
		this.seller = seller;
		this.item = item;
	}

	public Inventory() {
		super();
	}
	

	public Seller getSeller() {
		return seller;
	}

	public void setSeller(Seller seller) {
		this.seller = seller;
	}

	@Override
	public String toString() {
		return "Inventory [id=" + id + ", seller=" + seller + ", item=" + item + ", purchases=" + purchases.size() + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Inventory other = (Inventory) obj;
		if (id != other.id)
			return false;
		return true;
	}
	

}
