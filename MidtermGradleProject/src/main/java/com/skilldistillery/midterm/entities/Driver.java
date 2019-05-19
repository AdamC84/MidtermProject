package com.skilldistillery.midterm.entities;

import java.util.ArrayList;
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
public class Driver {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "bank_routing")
	private int bankRouting;
	@Column(name = "bank_name")
	private String bankName;
	@Column(name = "bank_acct_num")
	private int bankAcctNum;
	@OneToOne
	@JoinColumn(name = "user_id")
	private User user;
	@OneToMany(mappedBy = "driver")
	private List<DeliveryDetails> deliveryDetails;
	
	
	
	
	public void addDeliveryDetail(DeliveryDetails detail) {
		if(deliveryDetails == null) {
			deliveryDetails = new ArrayList<>();
		}
		if(! deliveryDetails.contains(detail)) {
			deliveryDetails.add(detail);
		}
		detail.setDriver(this);
	}
	
	public void removeDeliveryDetail(DeliveryDetails detail) {
		detail.setDriver(null);
		if(deliveryDetails != null) {
			deliveryDetails.remove(detail);
		}
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	
	
	
	public List<DeliveryDetails> getDeliveryDetails() {
		return deliveryDetails;
	}

	public void setDeliveryDetails(List<DeliveryDetails> deliveryDetails) {
		this.deliveryDetails = deliveryDetails;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Driver [id=" + id + ", bankRouting=" + bankRouting + ", bankName="
				+ bankName + ", bankAcctNum=" + bankAcctNum + ", user=" + user + "]";
	}
	
	
	public Driver(int id, int bankRouting, String bankName, int bankAcctNum, User user) {
		super();
		this.id = id;
		this.bankRouting = bankRouting;
		this.bankName = bankName;
		this.bankAcctNum = bankAcctNum;
		this.user = user;
	}
	
	
	public Driver(String bankName) {
		super();
		this.bankName = bankName;
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
