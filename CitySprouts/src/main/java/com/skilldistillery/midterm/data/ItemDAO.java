package com.skilldistillery.midterm.data;

import java.util.List;

import com.skilldistillery.midterm.entities.Category;
import com.skilldistillery.midterm.entities.Commodity;
import com.skilldistillery.midterm.entities.Inventory;
import com.skilldistillery.midterm.entities.Item;
import com.skilldistillery.midterm.entities.Purchase;
import com.skilldistillery.midterm.entities.PurchaseStatus;
import com.skilldistillery.midterm.entities.Seller;
import com.skilldistillery.midterm.entities.Unit;
import com.skilldistillery.midterm.entities.Variety;

public interface ItemDAO {
	
	public List<Item> getItemsByCategoryId(int id);
//	public Item addItem(Item i);
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
	Inventory addItemToInventory(Item item, Seller seller);
	List<Inventory> getSellerInventory(Seller seller);
	List<Inventory> getSellerInventoryById(int id);
	Item addItem(Item i, Seller s);
	Item getItemByItemId(int id);
	List<Inventory> getItemsByKeyword(String keyword);

	Inventory getInventoryByItemId(int id);
	public PurchaseStatus getPurchaseStatusById(int i);
	int getPriceOfAllItemsInCart(int id);
	Purchase getPurchaseById(int id);
	List<Purchase> getPurchaseByBuyerId(int id);
	PurchaseStatus getPurchaseStatusByName(String name);

	Purchase addPurchase(Purchase p);






}
