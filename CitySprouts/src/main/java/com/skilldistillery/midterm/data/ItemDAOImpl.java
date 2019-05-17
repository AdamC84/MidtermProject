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
	public List<Item> getItemsByCategoryId(int id) {
		String query = "Select item from Item item where item.category_id = :id";
		List<Item> items = em.createQuery(query, Item.class).setParameter("id", id).getResultList();
		return items;
	}


	@Override
	public Item addItem(Item i) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Item updateItem(Item i) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Item deleteItem(Item i) {
		// TODO Auto-generated method stub
		return null;
	}
}
