package com.skilldistillery.midterm.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Purchase {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "buyer_id")
	private Buyer buyer;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "purchase_status_id")
	private PurchaseStatus purchaseStatus;
	@OneToOne
	@JoinColumn(name = "delivery_details_id")
	private DeliveryDetails deliveryDetails;
	@OneToMany(mappedBy = "purchase")
	private List<Payment> payments;

	
	@OneToMany(mappedBy = "purchase")
	private List<Inventory> inventory;


	
	
	public List<Inventory> getInventory() {
		return inventory;
	}

	public void setInventory(List<Inventory> inventory) {
		this.inventory = inventory;
	}


	public void addPayment(Payment payment) {
		if (payments == null) {
			payments = new ArrayList<>();
		}
		if (!payments.contains(payment)) {
			payments.add(payment);
		}
		payment.setPurchase(this);
	}

	public void removePayment(Payment payment) {
		payment.setPurchase(null);
		if (payments != null) {
			payments.remove(payment);
		}
	}
	public void addInventory(Inventory inventory) {
		if (this.inventory == null) {
			this.inventory = new ArrayList<>();
		}
		if (!this.inventory.contains(inventory)) {
			this.inventory.add(inventory);
		}
		inventory.setPurchase(this);
	}
	public void removeInventory(Inventory inventory) {
		inventory.setPurchase(null);
		if (this.inventory != null) {
			this.inventory.remove(inventory);
		}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Buyer getBuyer() {
		return buyer;
	}

	public void setBuyer(Buyer buyer) {
		this.buyer = buyer;
	}

	public PurchaseStatus getPurchaseStatus() {
		return purchaseStatus;
	}

	public void setPurchaseStatus(PurchaseStatus purchaseStatus) {
		this.purchaseStatus = purchaseStatus;
	}

	public DeliveryDetails getDeliveryDetails() {
		return deliveryDetails;
	}

	public void setDeliveryDetails(DeliveryDetails deliveryDetails) {
		this.deliveryDetails = deliveryDetails;
	}

	public List<Payment> getPayments() {
		return payments;
	}

	public void setPayments(List<Payment> payments) {
		this.payments = payments;
	}



	public Purchase() {
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
		Purchase other = (Purchase) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Purchase [id=" + id + ", buyer=" + buyer + ", purchaseStatus=" + purchaseStatus + ", deliveryDetails=";
//				+ deliveryDetails + ", payments=" + payments.size() + ", inventory=" + inventory.size() + "]";
	}



}
