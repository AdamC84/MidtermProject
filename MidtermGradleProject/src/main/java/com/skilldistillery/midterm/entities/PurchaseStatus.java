package com.skilldistillery.midterm.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class PurchaseStatus {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String status;
	@OneToMany(mappedBy = "purchaseStatus", fetch = FetchType.EAGER)
	private List<Purchase> purchases;
	
	
	
	public void addPurchase(Purchase purchase) {
		if(purchases == null) {
			purchases = new ArrayList<>();
		}
		if(! purchases.contains(purchase)) {
			purchases.add(purchase);
		}
		purchase.setPurchaseStatus(this);
	}
	
	public void removePurchase(Purchase purchase) {
		purchase.setPurchaseStatus(null);
		if(purchases != null) {
			purchases.remove(purchase);
		}
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public List<Purchase> getPurchases() {
		return purchases;
	}
	public void setPurchases(List<Purchase> purchases) {
		this.purchases = purchases;
	}
	public PurchaseStatus(int id, String status, List<Purchase> purchases) {
		super();
		this.id = id;
		this.status = status;
		this.purchases = purchases;
	}
	
	
	public PurchaseStatus(String status) {
		super();
		this.status = status;
	}

	public PurchaseStatus() {
		super();
	}
	@Override
	public String toString() {
		return "PurchaseStatus [id=" + id + ", status=" + status + ", purchases=" + purchases.size() + "]";
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
		PurchaseStatus other = (PurchaseStatus) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	
}
