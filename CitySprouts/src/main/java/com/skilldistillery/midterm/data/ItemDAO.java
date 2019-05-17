package com.skilldistillery.midterm.data;

import java.util.List;

import com.skilldistillery.midterm.entities.Item;

public interface ItemDAO {
	
	public List<Item> getItemsByCategoryId(int id);
	public Item addItem(Item i);
	public Item updateItem(Item i);
	public Item deleteItem(Item i);
}
