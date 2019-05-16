package com.skilldistillery.midterm.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Seller {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "user_id")
	private int userId;
	@Column(name = "address_id")
	private int addressId;
	@Column(name = "bank_acct_num")
	private String bankAcctNum;
	@Column(name = "bank_routing")
	private String bankRouting;
	@Column(name = "bank_name")
	private String bankName;
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	@OneToOne
	@JoinColumn(name = "address_id")
	private Address address;
	@OneToMany
	@JoinColumn(name = "seller_id")
	private Inventory inventory;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
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
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public Inventory getInventory() {
		return inventory;
	}
	public void setInventory(Inventory inventory) {
		this.inventory = inventory;
	}
	public Seller(int id, int userId, int addressId, String bankAcctNum, String bankRouting, String bankName, User user,
			Address address, Inventory inventory) {
		super();
		this.id = id;
		this.userId = userId;
		this.addressId = addressId;
		this.bankAcctNum = bankAcctNum;
		this.bankRouting = bankRouting;
		this.bankName = bankName;
		this.user = user;
		this.address = address;
		this.inventory = inventory;
	}
	public Seller() {
		super();
	}
	@Override
	public String toString() {
		return "Seller [id=" + id + ", userId=" + userId + ", addressId=" + addressId + ", bankAcctNum=" + bankAcctNum
				+ ", bankRouting=" + bankRouting + ", bankName=" + bankName + ", user=" + user + ", inventory="
				+ inventory + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + addressId;
		result = prime * result + ((bankAcctNum == null) ? 0 : bankAcctNum.hashCode());
		result = prime * result + ((bankName == null) ? 0 : bankName.hashCode());
		result = prime * result + ((bankRouting == null) ? 0 : bankRouting.hashCode());
		result = prime * result + id;
		result = prime * result + ((inventory == null) ? 0 : inventory.hashCode());
		result = prime * result + ((user == null) ? 0 : user.hashCode());
		result = prime * result + userId;
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
		if (addressId != other.addressId)
			return false;
		if (bankAcctNum == null) {
			if (other.bankAcctNum != null)
				return false;
		} else if (!bankAcctNum.equals(other.bankAcctNum))
			return false;
		if (bankName == null) {
			if (other.bankName != null)
				return false;
		} else if (!bankName.equals(other.bankName))
			return false;
		if (bankRouting == null) {
			if (other.bankRouting != null)
				return false;
		} else if (!bankRouting.equals(other.bankRouting))
			return false;
		if (id != other.id)
			return false;
		if (inventory == null) {
			if (other.inventory != null)
				return false;
		} else if (!inventory.equals(other.inventory))
			return false;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}
	

	
	

}
