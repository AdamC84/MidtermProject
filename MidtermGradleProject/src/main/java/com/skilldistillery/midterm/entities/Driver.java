package com.skilldistillery.midterm.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Driver {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "address_id")
	private int addressId;
	@Column(name = "bank_routing")
	private int bankRouting;
	@Column(name = "bank_name")
	private String bankName;
	@Column(name = "bank_acct_num")
	private int bankAcctNum;
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	
	
	
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public int getBankRouting() {
		return bankRouting;
	}
	public void setBankRouting(int bankRouting) {
		this.bankRouting = bankRouting;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public int getBankAcctNum() {
		return bankAcctNum;
	}
	public void setBankAcctNum(int bankAcctNum) {
		this.bankAcctNum = bankAcctNum;
	}
	
	@Override
	public String toString() {
		return "Driver [id=" + id + ", addressId=" + addressId + ", bankRouting=" + bankRouting + ", bankName="
				+ bankName + ", bankAcctNum=" + bankAcctNum + ", user=" + user + "]";
	}
	
	
	public Driver(int id, int addressId, int bankRouting, String bankName, int bankAcctNum, User user) {
		super();
		this.id = id;
		this.addressId = addressId;
		this.bankRouting = bankRouting;
		this.bankName = bankName;
		this.bankAcctNum = bankAcctNum;
		this.user = user;
	}
	public Driver() {
		super();
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
		Driver other = (Driver) obj;
		if (id != other.id)
			return false;
		return true;
	}
	public void setDriver(User user) {
		this.user = user;
		
	}
	public User getUser() {
		return user;
	}
	
	
}
