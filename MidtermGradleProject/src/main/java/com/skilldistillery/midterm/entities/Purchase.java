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
import javax.persistence.OneToOne;
@Entity
public class Purchase {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name = "buyer_id")
	private Buyer buyer;
	@ManyToOne
	@JoinColumn(name = "purchase_status_id")
	private PurchaseStatus purchaseStatus;
	@OneToOne
	@JoinColumn(name = "delivery_details_id")
	private DeliveryDetails deliveryDetails;
	@OneToMany(mappedBy = "purchase")
	private List<Payment> payments;
	@OneToMany(mappedBy = "purchase")
	private List<PurchaseItem> purchaseItems;
	
	
	
	public void addPurchaseItem(PurchaseItem item) {
		if(purchaseItems == null) {
			purchaseItems = new ArrayList<>();
		}
		if(! purchaseItems.contains(item)) {
			purchaseItems.add(item);
		}
		item.setPurchase(this);
	}
	
	public void removePurchaseItem(PurchaseItem item) {
		item.setPurchase(null);
		if(purchaseItems != null) {
			purchaseItems.remove(item);
		}
	}
	public void addPayment(Payment payment) {
		if(payments == null) {
			payments = new ArrayList<>();
		}
		if(! payments.contains(payment)) {
			payments.add(payment);
		}
		payment.setPurchase(this);
	}
	
	public void removePayment(Payment payment) {
		payment.setPurchase(null);
		if(payments != null) {
			payments.remove(payment);
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
	public List<PurchaseItem> getPurchaseItems() {
		return purchaseItems;
	}
	public void setPurchaseItems(List<PurchaseItem> purchaseItems) {
		this.purchaseItems = purchaseItems;
	}
	public Purchase(int id, Buyer buyer, PurchaseStatus purchaseStatus, DeliveryDetails deliveryDetails,
			List<Payment> payments, List<PurchaseItem> purchaseItems) {
		super();
		this.id = id;
		this.buyer = buyer;
		this.purchaseStatus = purchaseStatus;
		this.deliveryDetails = deliveryDetails;
		this.payments = payments;
		this.purchaseItems = purchaseItems;
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
		return "Purchase [id=" + id + ", buyer=" + buyer + ", purchaseStatus=" + purchaseStatus + ", deliveryDetails="
				+ deliveryDetails + ", payments=" + payments.size() + ", purchaseItems=" + purchaseItems.size() + "]";
	}
	
	
	
}
