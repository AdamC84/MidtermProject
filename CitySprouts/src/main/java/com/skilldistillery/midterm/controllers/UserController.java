package com.skilldistillery.midterm.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.ItemDAO;
import com.skilldistillery.midterm.data.UserDAO;
import com.skilldistillery.midterm.entities.Item;
import com.skilldistillery.midterm.entities.Unit;
import com.skilldistillery.midterm.entities.User;

@Controller
public class UserController {

	@Autowired
	UserDAO d;
	@Autowired
	ItemDAO iDao;
	
	
	@RequestMapping(path = "home.do")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping(path = "cart.do")
	public ModelAndView cart() {
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("cart");
		return mv;
	}
	@RequestMapping(path = "buyerLearnMore.do")
	public ModelAndView bLearnMore() {
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("buyerLearnMore");
		return mv;
	}
	@RequestMapping(path = "searchResults.do")
	public ModelAndView search() {
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("searchResults");
		return mv;
	}
	@RequestMapping(path = "sellerLearnMore.do")
	public ModelAndView sLearnMore() {
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("sellerLearnMore");
		return mv;
	}
	@RequestMapping(path = "editProfile.do")
	public ModelAndView edit() {
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("editProfile");
		return mv;
	}
	
	@RequestMapping(path = "getDrivers.do")
	public ModelAndView getAllUsers() {
		ModelAndView mv = new ModelAndView();
		List<User> user = d.getAllUsers();
		
		mv.addObject("users", user);
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping(path = "orderHistory.do")
	public ModelAndView OrderHistory() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("OrderHistory");
		return mv;
	}
	@RequestMapping(path = "addItemView.do")
	public ModelAndView addItemV() {
		ModelAndView mv = new ModelAndView();
		Item i = new Item();
		System.out.println("**********************1111111111111111");
		List<Unit> u = iDao.getAllUnits();
		System.out.println(u);
		mv.addObject("item", i);
		mv.addObject("unit", u);
		mv.setViewName("sellerLoggedIn");
		return mv;
	}

}
