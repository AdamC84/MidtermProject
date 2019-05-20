package com.skilldistillery.midterm.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.midterm.entities.Category;
import com.skilldistillery.midterm.entities.Commodity;
import com.skilldistillery.midterm.entities.Inventory;
import com.skilldistillery.midterm.entities.Item;
import com.skilldistillery.midterm.entities.Seller;
import com.skilldistillery.midterm.entities.Unit;
import com.skilldistillery.midterm.entities.Variety;

@Transactional
@Service
public class ItemDAOImpl implements ItemDAO {

	
	@PersistenceContext
	private EntityManager em;
	
	
	
	@Override
	public List<Item> getAllItems() {
		String query = "Select i from Item i";
		List<Item> items = em.createQuery(query, Item.class).getResultList();
		return items;
	}
	@Override
	public List<Item> getItemsByVarietyId(int id) {
		String query = "Select item from Item item where item.variety.id = :id";
		List<Item> items = em.createQuery(query, Item.class).setParameter("id", id).getResultList();
		return items;
	}
	@Override
	public List<Item> getItemsByCommodityId(int id) {
		String query = "Select item from Item item where item.commodity.id = :id";
		List<Item> items = em.createQuery(query, Item.class).setParameter("id", id).getResultList();
		return items;
	}
	@Override
	public List<Item> getItemsByUnitId(int id) {
		String query = "Select item from Item item where item.unit.id = :id";
		List<Item> items = em.createQuery(query, Item.class).setParameter("id", id).getResultList();
		return items;
	}
	@Override
	public List<Unit> getAllUnits() {
		String query = "Select unit from Unit unit";
		List<Unit> units = em.createQuery(query, Unit.class).getResultList();
		System.out.println(units);
		return units;
	}
	@Override
	public List<Commodity> getAllCommodities() {
		String query = "Select c from Commodity c";
		List<Commodity> comms = em.createQuery(query, Commodity.class).getResultList();
		return comms;
	}
	@Override
	public List<Variety> getAllVariety() {
		String query = "Select v from Variety v";
		List<Variety> vars = em.createQuery(query, Variety.class).getResultList();
		return vars;
	}
	@Override
	public List<Category> getAllCategory() {
		String query = "Select c from Category c";
		List<Category> cats = em.createQuery(query, Category.class).getResultList();
		return cats;
	}
	
	@Override
	public List<Item> getItemsByCategoryId(int id) {
		String query = "Select item from Item item where item.category.id = :id";
		List<Item> items = em.createQuery(query, Item.class).setParameter("id", id).getResultList();
		return items;
	}
	@Override
	public List<Item> getItemsByCategoryName(String name) {
		String query = "Select item from Item item where item.category.name = :name";
		List<Item> items = em.createQuery(query, Item.class).setParameter("name",name).getResultList();
		return items;
	}
	@Override
	public List<Item> getItemsByVarietyName(String name) {
		String query = "Select item from Item item where item.variety.name = :name";
		List<Item> items = em.createQuery(query, Item.class).setParameter("name", name).getResultList();
		return items;
	}
	@Override
	public List<Item> getItemsByCommodityName(String name) {
		String query = "Select item from Item item where item.variety.name = :name";
		List<Item> items = em.createQuery(query, Item.class).setParameter("name", name).getResultList();
		return items;
	}
	@Override
	public List<Item> getItemsByUnitName(String name) {
		String query = "Select item from Item item where item.unit.name = :name";
		List<Item> items = em.createQuery(query, Item.class).setParameter("name", name).getResultList();
		return items;
	}
	@Override
	public List<Item> getItemsSortedByPickedDate() {
		String query = "Select i from Item i order by i.picked";
		List<Item> items = em.createQuery(query, Item.class).getResultList();
		return items;
	}
	@Override
	public List<Item> getItemsSortedByPrice(String name) {
		String query = "Select item from Item item order by price";
		List<Item> items = em.createQuery(query, Item.class).getResultList();
		return items;
	}
	@Override
	public List<Item> getItemsSortedByBestByDate(String name) {
		String query = "Select item from Item item order by bestBy";
		List<Item> items = em.createQuery(query, Item.class).getResultList();
		return items;
	}
	@Override
	public Item addItem(Item i) {
		Item item = new Item();
		item.setBestBy(i.getBestBy());
		item.setCategory(i.getCategory());
		item.setCommodity(i.getCommodity());
		item.setDescription(i.getDescription());
		item.setInventories(i.getInventories());
		item.setLastUpdated(i.getLastUpdated());
		item.setName(i.getName());
		item.setPicked(i.getPicked());
		item.setPrice(i.getPrice());
		item.setUnit(i.getUnit());
		item.setVariety(i.getVariety());
		item.setActive(i.getActive());
		em.persist(item);
		em.flush();
		return item;
	}
	@Override
	public Item updateItem(Item i) {
		Item item = em.find(Item.class, i.getId());
		item.setBestBy(i.getBestBy());
		item.setCategory(i.getCategory());
		item.setCommodity(i.getCommodity());
		item.setDescription(i.getDescription());
		item.setInventories(i.getInventories());
		item.setLastUpdated(i.getLastUpdated());
		item.setName(i.getName());
		item.setPicked(i.getPicked());
		item.setPrice(i.getPrice());
		item.setUnit(i.getUnit());
		item.setVariety(i.getVariety());
		item.setActive(i.getActive());
		em.persist(item);
		em.flush();
		return item;
	}
	@Override
	public Item deleteItem(Item i) {
		Item item = em.find(Item.class, i.getId());
		em.remove(item);
		return item;
	}
	@Override
	public Inventory addItemToInventory(Inventory inventory) {
		Inventory i = new Inventory();
		i.setItem(inventory.getItem());
		em.persist(i);
		em.flush();
		return i;
	}
	@Override
	public List<Inventory> getSellerInventory(Seller seller) {
		String query = "Select i from Inventory i where i.sellerId = :id";
		List<Inventory> inventories = em.createQuery(query, Inventory.class).setParameter("id", seller.getId()).getResultList();
		return inventories;
	}
	@Override
	public List<Inventory> getSellerInventoryById(int id) {
		String query = "Select i from Inventory i where i.sellerId = :id";
		List<Inventory> inventories = em.createQuery(query, Inventory.class).setParameter("id", id).getResultList();
		return inventories;
		
	}
	@Override
	public List<Item> getAllItemsNotInInventory(Seller seller){
		String query = "Select i from Item i where Inventory.item.id = null and Inventory.seller.id = :id";
		List<Item> items = em.createQuery(query, Item.class).setParameter("id", seller.getId()).getResultList();
		return items;
	}
}
