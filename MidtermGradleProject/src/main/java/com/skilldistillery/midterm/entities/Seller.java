package com.skilldistillery.midterm.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Seller {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "bank_acct_num")
	private String bankAcctNum;
	@Column(name = "bank_routing")
	private String bankRouting;
	@Column(name = "bank_name")
	private String bankName;
	@OneToOne
	@JoinColumn(name = "user_id")
	private User user;
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "seller_id")
	private List<Inventory> inventories;
	@Column(name = "store_name")
	private String storeName;
	private int active;
	
	
	
	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public List<Inventory> getInventories() {
		return inventories;
	}

	public void setInventories(List<Inventory> inventories) {
		this.inventories = inventories;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public void addInventory(Inventory inventory) {
		if(inventories == null) {
			inventories = new ArrayList<>();
		}
		if(! inventories.contains(inventory)) {
			inventories.add(inventory);
			
			
		}
		inventory.setSeller(this);
	}
	
	public void removeInventory(Inventory inventory) {
		inventory.setSeller(null);
		if(inventories != null) {
			inventories.remove(inventory);
		}
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getBankAcctNum() {
		return bankAcctNum;
	}
	public void setBankAcctNum(String bankAcctNum) {
		this.bankAcctNum = bankAcctNum;
	}
	public String getBankRouting() {
		return bankRouting;
	}
	public void setBankRouting(String bankRouting) {
		this.bankRouting = bankRouting;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	
	
	public List<Inventory> getInventory() {
		return inventories;
	}
	public void setInventory(List<Inventory> inventory) {
		this.inventories = inventory;
	}
	
	

	public Seller(int id, String bankAcctNum, String bankRouting, String bankName, User user,
			List<Inventory> inventory) {
		super();
		this.id = id;
		this.bankAcctNum = bankAcctNum;
		this.bankRouting = bankRouting;
		this.bankName = bankName;
		this.user = user;
		this.inventories = inventory;
	}
	public Seller() {
		super();
	}
	@Override
	public String toString() {
		return "Seller [id=" + id + ", bankAcctNum=" + bankAcctNum + ", bankRouting=" + bankRouting + ", bankName="
				+ bankName + ", user=" + user  + ", inventory=" + "" + "]";
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
		Seller other = (Seller) obj;
		if (id != other.id)
			return false;
		return true;
	}
	

	
	

}
