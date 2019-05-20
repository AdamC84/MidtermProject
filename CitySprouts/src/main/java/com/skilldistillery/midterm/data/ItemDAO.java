package com.skilldistillery.midterm.data;

import java.util.List;

import com.skilldistillery.midterm.entities.Category;
import com.skilldistillery.midterm.entities.Commodity;
import com.skilldistillery.midterm.entities.Inventory;
import com.skilldistillery.midterm.entities.Item;
import com.skilldistillery.midterm.entities.Seller;
import com.skilldistillery.midterm.entities.Unit;
import com.skilldistillery.midterm.entities.Variety;

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
	List<Unit> getAllUnits();
	List<Commodity> getAllCommodities();
	List<Variety> getAllVariety();
	List<Category> getAllCategory();
	Inventory addItemToInventory(Inventory inventory);
	List<Inventory> getSellerInventory(Seller seller);
	List<Inventory> getSellerInventoryById(int id);
	List<Item> getItemsByName(String keyword);
	Item getItemByItemId(int id);
}
