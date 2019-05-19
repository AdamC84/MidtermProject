package com.skilldistillery.midterm.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
@Entity
public class Variety {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	@OneToMany(mappedBy = "variety")
	private List<Item> items;
	
	
	public void addItem(Item item) {
		if(items == null) {
			items = new ArrayList<>();
		}
		if(! items.contains(item)) {
			items.add(item);
		}
		item.setVariety(this);
	}
	public void removeItem(Item item) {
		item.setVariety(null);
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
	@Override
	public String toString() {
		return "Variety [id=" + id + ", name=" + name + ", items="  + "]";
	}
	public Variety(int id, String name, List<Item> items) {
		super();
		this.id = id;
		this.name = name;
		this.items = items;
	}
	public Variety() {
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
		Variety other = (Variety) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	
	
}
