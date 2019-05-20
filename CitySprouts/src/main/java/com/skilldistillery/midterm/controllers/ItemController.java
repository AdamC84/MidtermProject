package com.skilldistillery.midterm.controllers;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.ItemDAO;
import com.skilldistillery.midterm.entities.Inventory;
import com.skilldistillery.midterm.entities.Item;
import com.skilldistillery.midterm.entities.Seller;

@Controller
public class ItemController {

	@Autowired
	private ItemDAO itemDao;
	
	@RequestMapping(path = "")
	public ModelAndView homePage() {
		ModelAndView mv = new ModelAndView();
		List<Item> randomList = itemDao.getAllItems();
		Collections.shuffle(randomList);
		List<Item> sortedByDate = itemDao.getItemsSortedByPickedDate();
		
		mv.addObject("random", randomList);
		mv.addObject("fresh", sortedByDate);
		
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping(path="addItem.do", method = RequestMethod.POST)
	public String addItem(Model model, Item item, HttpSession session ){
		item.setActive(1);
		Seller seller = (Seller) session.getAttribute("seller");
		System.out.println("seller ****  " + seller);
		
//		Inventory i = seller.getInventory();
//		i.setItem(item);
		
		item = itemDao.addItem(item);
//		itemDao.addItemToInventory(i);
		System.out.println("************" + item);
		
		model.addAttribute("seller",seller);
		model.addAttribute("item", item);
		return "sellerLoggedIn";
	}
}
