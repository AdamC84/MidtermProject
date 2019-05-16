package com.skilldistillery.midterm.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Inventory {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int seller_id;
	@ManyToOne
	@JoinColumn(name = "seller_id")
	private Seller seller;
	@OneToMany(mappedBy = "inventory")
	private List<Purchase> purchases;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(int seller_id) {
		this.seller_id = seller_id;
	}

	public Inventory(int id, int seller_id) {
		super();
		this.id = id;
		this.seller_id = seller_id;
	}

	public Inventory() {
		super();
	}

	@Override
	public String toString() {
		return "Inventory [id=" + id + ", seller_id=" + seller_id + "]";
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
	public void addPurchase(Purchase purchase) {
		if (purchases == null)
			purchases = new ArrayList<Purchase>();

		if (!purchases.contains(purchase)) {
			purchases.add(purchase);
			purchase.addInventory(this);
		}
	}

	public void removeActor(Actor actor) {
		if (actors != null && actors.contains(actor)) {
			actors.remove(actor);
			actor.removeFilm(this);
		}
	}

}
