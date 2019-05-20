package com.skilldistillery.midterm.entities;

import java.util.List;

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
	@OneToMany(mappedBy = "seller")
	private List<Inventory> inventory;
	@Column(name = "store_name")
	private String storeName;
	private int active;
	@OneToMany(mappedBy = "seller")
	private List<Item> items;
	
	
	
	
	
	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	public void setInventory(List<Inventory> inventory) {
		this.inventory = inventory;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
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

	
	
	
	
	
	

	
	public Seller(int id, String bankAcctNum, String bankRouting, String bankName, User user, List<Inventory> inventory,
			String storeName, int active, List<Item> items) {
		super();
		this.id = id;
		this.bankAcctNum = bankAcctNum;
		this.bankRouting = bankRouting;
		this.bankName = bankName;
		this.user = user;
		this.inventory = inventory;
		this.storeName = storeName;
		this.active = active;
		this.items = items;
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
