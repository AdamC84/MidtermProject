package com.skilldistillery.midterm.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class PurchaseItem {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name = "purchase_id")
	private Purchase purchase;
	@ManyToOne
	@JoinColumn(name = "inventory_id")
	private Inventory inventory;
	
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Purchase getPurchase() {
		return purchase;
	}
	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}
	public Inventory getInventory() {
		return inventory;
	}
	public void setInventory(Inventory inventory) {
		this.inventory = inventory;
	}
	public PurchaseItem(int id, Purchase purchase, Inventory inventory) {
		super();
		this.id = id;
		this.purchase = purchase;
		this.inventory = inventory;
	}
	public PurchaseItem() {
		super();
	}
	@Override
	public String toString() {
		return "PurchaseItem [id=" + id + ", purchase=" + purchase + ", inventory=" + inventory + "]";
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
		PurchaseItem other = (PurchaseItem) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	
}
