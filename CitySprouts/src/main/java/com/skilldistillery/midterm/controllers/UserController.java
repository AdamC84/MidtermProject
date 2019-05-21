package com.skilldistillery.midterm.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.ItemDAO;
import com.skilldistillery.midterm.data.UserDAO;
import com.skilldistillery.midterm.entities.Buyer;
import com.skilldistillery.midterm.entities.Category;
import com.skilldistillery.midterm.entities.Item;
import com.skilldistillery.midterm.entities.Seller;
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
	public String edit(HttpSession session, Model model) {
		User u = (User)session.getAttribute("user");
		String role = u.getRole().toString();
		if (role.equals("BUYER")) {
			Buyer buyer = d.getBuyerByUserId(u.getId());
			model.addAttribute(buyer);
			return "editBuyer";
		} else if (role.equals("SELLER")) {
			Seller seller = d.getSellerByUserId(u.getId());
			if (iDao.getSellerInventory(seller) != null) {
				model.addAttribute("inventory", iDao.getSellerInventory(seller));
			}
			model.addAttribute(seller);
			return "editProfile";
		} else if (role.equals("DRIVER")) {
			return "driverLoggedIn";
		} else if (role.equals("ADMIN")) {
			return "adminLoggedIn";
		} else {
			return "index";
		}
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
	@RequestMapping(path = "getStoreNames.do")
	public ModelAndView storeList() {
		ModelAndView mv = new ModelAndView();
		List<String> storeList = new ArrayList<String>();
		List<Seller> seller = d.getAllSellers();
		for (Seller seller2 : seller) {
			storeList.add(seller2.getStoreName());
		}
		
		mv.addObject("storeList", storeList);
		mv.setViewName("storeNames");
		return mv;
	}
	@RequestMapping(path = "addItemView.do")
	public String addItemV(Model model, int id) {
		Item i = new Item();
		Seller seller = d.getSellerById(id);
		List<Unit> u = iDao.getAllUnits();
		List<Category> c = iDao.getAllCategory();
		model.addAttribute(u);
		model.addAttribute(c);
		model.addAttribute(seller);
		model.addAttribute(i);
		
		return "sellerLoggedIn";
	}

}
