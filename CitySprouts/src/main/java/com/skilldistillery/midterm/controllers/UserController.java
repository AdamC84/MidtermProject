package com.skilldistillery.midterm.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.ItemDAO;
import com.skilldistillery.midterm.data.UserDAO;
import com.skilldistillery.midterm.entities.Category;
import com.skilldistillery.midterm.entities.Commodity;
import com.skilldistillery.midterm.entities.Item;
import com.skilldistillery.midterm.entities.Seller;
import com.skilldistillery.midterm.entities.Unit;
import com.skilldistillery.midterm.entities.User;
import com.skilldistillery.midterm.entities.Variety;

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
//	@RequestMapping(path = "purchaseResults.do")
//	public ModelAndView purchaseResults() {
//		ModelAndView mv = new ModelAndView();		
//		mv.setViewName("purchaseResults");
//		return mv;
//	}
	
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
	public String addItemV(Model model, int id) {
		Item i = new Item();
		Seller seller = d.getSellerById(id);
		List<Unit> u = iDao.getAllUnits();
//		List<Variety> v = iDao.getAllVariety();
		List<Category> c = iDao.getAllCategory();
//		List<Commodity> com = iDao.getAllCommodities();
		model.addAttribute(u);
//		model.addAttribute(v);
		model.addAttribute(c);
//		model.addAttribute(com);
		model.addAttribute(seller);
		model.addAttribute(i);
		
		return "sellerLoggedIn";
	}

}
