package com.skilldistillery.midterm.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Unit {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	@OneToMany(mappedBy = "unit")
	private List<Item> items;
	
	
	
	
	
	public void addItem(Item item) {
		if(items == null) {
			items = new ArrayList<>();
		}
		if(! items.contains(item)) {
			items.add(item);
		}
		item.setUnit(this);
	}
	public void removeItem(Item item) {
		item.setUnit(null);
		if(items != null) {
			items.remove(item);
		}
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
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	public Unit(int id, String unit, List<Item> items) {
		super();
		this.id = id;
		this.name = unit;
		this.items = items;
	}
	public Unit() {
		super();
	}
	@Override
	public String toString() {
		if(items == null) {
			return "Unit [id=" + id + ", name=" + name + ", items=" + "0" + "]";
		}else {
			return "Unit [id=" + id + ", name=" + name + ", items=" + items.size() + "]";
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
		Unit other = (Unit) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	
	
	
}
