package com.skilldistillery.midterm.data;

import java.util.List;

import com.skilldistillery.midterm.entities.Item;

public interface ItemDAO {

	public List<Item> getItemsByCategoryId(int id);
	
}
