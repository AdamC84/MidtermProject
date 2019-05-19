package com.skilldistillery.midterm.controllers;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.ItemDAO;
import com.skilldistillery.midterm.entities.Item;

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
	
	@RequestMapping(path="addItem.do")
	public String addItem(Model model, Item item){
	    item.setActive(1);
		item = itemDao.addItem(item);
		
		model.addAttribute("item", item);
		return "sellerLoggedIn";
	}
}
