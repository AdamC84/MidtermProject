package com.skilldistillery.midterm.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
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

	@ManyToMany
	@JoinTable(name = "purchase_item", joinColumns = @JoinColumn(name = "purchase_id"), inverseJoinColumns = @JoinColumn(name = "inventory_id"))
	private List<Inventory> inventoryItems;

	
	
	public List<Inventory> getInventoryItems() {
		return inventoryItems;
	}

	public void setInventoryItems(List<Inventory> inventoryItems) {
		this.inventoryItems = inventoryItems;
	}

	public void addInventoryItem(Inventory inventory) {
		if (inventoryItems == null) {
			inventoryItems = new ArrayList<>();
		}
		if (!inventoryItems.contains(inventory)) {
			inventoryItems.add(inventory);
			inventory.addPurchase(this);
		}
	}

	public void removeInventoryItem(Inventory inventory) {
		if (inventoryItems != null && inventoryItems.contains(inventory)) {
			inventoryItems.remove(inventory);
			inventory.removePurchase(this);
		}
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

	public Purchase(int id, Buyer buyer, PurchaseStatus purchaseStatus, DeliveryDetails deliveryDetails,
			List<Payment> payments, List<Inventory> inventoryItems) {
		super();
		this.id = id;
		this.buyer = buyer;
		this.purchaseStatus = purchaseStatus;
		this.deliveryDetails = deliveryDetails;
		this.payments = payments;
		this.inventoryItems = inventoryItems;
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
		StringBuilder builder = new StringBuilder();
		builder.append("Purchase [id=");
		builder.append(id);
		builder.append(", buyer=");
		builder.append(buyer);
		builder.append(", purchaseStatus=");
		builder.append(purchaseStatus);
		builder.append(", deliveryDetails=");
		builder.append(deliveryDetails);
		builder.append(", payments=");
		builder.append(payments);
		builder.append(", inventoryItemsCount=");

		if (inventoryItems != null) {
			builder.append(inventoryItems.size());
			builder.append("\n");

			for (Inventory inventory : inventoryItems) {
				builder.append("itemName= ");
				builder.append(inventory);
				builder.append("\n");
			}
		} else {
			builder.append(", No Items in this purchase");
		}

		builder.append("]");
		return builder.toString();
	}

}
