package com.skilldistillery.midterm.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.midterm.entities.Item;

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
		return null;
	}
	@Override
	public Item deleteItem(Item i) {
		Item item = em.find(Item.class, i.getId());
		em.remove(item);
		return item;
	}
}
