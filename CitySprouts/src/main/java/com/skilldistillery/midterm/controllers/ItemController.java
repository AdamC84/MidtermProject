package com.skilldistillery.midterm.controllers;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.ItemDAO;
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
		System.out.println("************");
		Seller seller = (Seller) session.getAttribute("seller");
		item.setSeller(seller);
		System.out.println("ITEM *****  "+item);
		
		item = itemDao.addItem(item);
		List<Item> items = itemDao.getAllItemsNotInInventory(seller);
		model.addAttribute("seller",seller);
		model.addAttribute("itemNot", item);
		model.addAttribute("itemNotInInventory", items);
		System.out.println("*******  "+items);
		return "sellerLoggedIn";
	}
	@RequestMapping(path="search.do", method = RequestMethod.GET)
	public ModelAndView keywordSearch(String keyword ){
		ModelAndView mv = new ModelAndView();
		List<Item> items = itemDao.getItemsByName(keyword);
		System.out.println(items);
		mv.addObject("items", items);
		mv.setViewName("buyerLoggedIn");
		return mv;
	}
	@RequestMapping(path="addToCart.do", method = RequestMethod.GET)
	public ModelAndView addItemToCart(@RequestParam("id")int id ){
		ModelAndView mv = new ModelAndView();
		Item i = itemDao.getItemByItemId(id);
		List<Item> items = new ArrayList<>();
		items.add(i);
		mv.addObject("items", items);
		mv.setViewName("cart");
		return mv;
	}
	@RequestMapping(path="itemDetails.do", method = RequestMethod.GET)
	public ModelAndView itemDetails(@RequestParam("id")int id ){
		ModelAndView mv = new ModelAndView();
		Item i = itemDao.getItemByItemId(id);
		System.out.println("*********" + i);
		List<Item> items = new ArrayList<>();
		items.add(i);
		System.out.println("*******************" + items);
		mv.addObject("items", items);
		mv.setViewName("itemDetails");
		return mv;
	}
}
