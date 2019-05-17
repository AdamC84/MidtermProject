package com.skilldistillery.midterm.data;

import java.util.List;

import com.skilldistillery.midterm.entities.Item;

public interface ItemDAO {
	
	public List<Item> getItemsByCategoryId(int id);
	public Item addItem(Item i);
	public Item updateItem(Item i);
	public Item deleteItem(Item i);
	List<Item> getItemsByVarietyId(int id);
	List<Item> getItemsByCommodityId(int id);
	List<Item> getItemsByUnitId(int id);
	List<Item> getItemsByCategoryName(String name);
	List<Item> getItemsByVarietyName(String name);
	List<Item> getItemsByCommodityName(String name);
	List<Item> getItemsByUnitName(String name);
	List<Item> getItemsSortedByPickedDate();
	List<Item> getItemsSortedByPrice(String name);
	List<Item> getItemsSortedByBestByDate(String name);
	List<Item> getAllItems();
}
