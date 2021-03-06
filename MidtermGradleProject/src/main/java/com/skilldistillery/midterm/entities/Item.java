package com.skilldistillery.midterm.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@Entity
public class Item {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String description;
	private double price;
	@Column(name = "best_by")
	@Temporal(TemporalType.DATE)
	private Date bestBy;
	@Temporal(TemporalType.DATE)
	private Date picked;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "category_id")
	private Category category;
	private String lastUpdated;
	@OneToMany(mappedBy = "item", fetch = FetchType.EAGER)
	private List<Inventory> inventories;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "unit_id")
	private Unit unit;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "commodity_id")
	private Commodity commodity;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "variety_id")
	private Variety variety;
	private int active;
	@Column(name = "img_url")
	private String imgUrl;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "seller_id")
	private Seller seller;


	

	public Item() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Date getBestBy() {
		return bestBy;
	}

	public void setBestBy(Date bestBy) {
		this.bestBy = bestBy;
	}

	public Date getPicked() {
		return picked;
	}

	public void setPicked(Date picked) {
		this.picked = picked;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getLastUpdated() {
		return lastUpdated;
	}

	public void setLastUpdated(String lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	public List<Inventory> getInventories() {
		return inventories;
	}

	public void setInventories(List<Inventory> inventories) {
		this.inventories = inventories;
	}

	public Unit getUnit() {
		return unit;
	}

	public void setUnit(Unit unit) {
		this.unit = unit;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public Variety getVariety() {
		return variety;
	}

	public void setVariety(Variety variety) {
		this.variety = variety;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public Seller getSeller() {
		return seller;
	}

	public void setSeller(Seller seller) {
		this.seller = seller;
	}

	public void addInventory(Inventory inventory) {
		if (inventories == null) {
			inventories = new ArrayList<>();
		}
		if (!inventories.contains(inventory)) {
			inventories.add(inventory);
		}
		inventory.setItem(this);
	}

	public void removeInventory(Inventory inventory) {
		inventory.setItem(null);
		if (inventories != null) {
			inventories.remove(inventory);
		}
	}


	public Item(int id, String name, String description, double price, Date bestBy, Date picked, Category category,
			String lastUpdated, List<Inventory> inventories, Unit unit, Commodity commodity, Variety variety,
			int active, String imgUrl) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.bestBy = bestBy;
		this.picked = picked;
		this.category = category;
		this.lastUpdated = lastUpdated;
		this.inventories = inventories;
		this.unit = unit;
		this.commodity = commodity;
		this.variety = variety;
		this.active = active;
		this.imgUrl = imgUrl;
	}



	public Item(int id, String name, String description, double price, Date bestBy, Date picked, Category category,
			String lastUpdated, List<Inventory> inventories) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.bestBy = bestBy;
		this.picked = picked;
		this.category = category;
		this.lastUpdated = lastUpdated;
		this.inventories = inventories;
	}

	@Override
	public String toString() {
		if (inventories == null) {
			return "Item [id=" + id + ", name=" + name + ", description=" + description + ", price=" + price
					+ ", bestBy=" + bestBy + ", picked=" + picked + ", category=" + category + ", lastUpdated="
					+ lastUpdated + ", inventories=" + "0" + ", unit=" + unit + ", commodity=" + commodity
					+ ", variety=" + variety + ", active=" + active +" seller, "+ seller +  "]";
		} else {
			return "Item [id=" + id + ", name=" + name + ", description=" + description + ", price=" + price
					+ ", bestBy=" + bestBy + ", picked=" + picked + ", category=" + category + ", lastUpdated="
					+ lastUpdated + ", inventories=" + inventories.size() + ", unit=" + unit + ", commodity="
					+ commodity + ", variety=" + variety + ", active=" + active + "seller = " + seller+ "]";
		}
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
		Item other = (Item) obj;
		if (id != other.id)
			return false;
		return true;
	}


}
