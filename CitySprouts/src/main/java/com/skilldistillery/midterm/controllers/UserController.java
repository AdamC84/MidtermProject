package com.skilldistillery.midterm.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.BuyerDAO;
import com.skilldistillery.midterm.data.ItemDAO;
import com.skilldistillery.midterm.data.SellerDAO;
import com.skilldistillery.midterm.data.UserDAO;
import com.skilldistillery.midterm.entities.Buyer;
import com.skilldistillery.midterm.entities.Category;
import com.skilldistillery.midterm.entities.Inventory;
import com.skilldistillery.midterm.entities.Item;
import com.skilldistillery.midterm.entities.Purchase;
import com.skilldistillery.midterm.entities.Seller;
import com.skilldistillery.midterm.entities.Unit;
import com.skilldistillery.midterm.entities.User;

@Controller
public class UserController {

	@Autowired
	UserDAO d;
	@Autowired
	BuyerDAO b;
	@Autowired
	ItemDAO iDao;
	@Autowired
	SellerDAO sDAO;
	
	
	@RequestMapping(path = "home.do")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping(path = "cart.do")
	public String cart(HttpSession session, Model model) {
		Buyer buyer = (Buyer)session.getAttribute("buyer");
		System.out.println(buyer);
		double total = 0;
		List<Purchase> purchasesPending = new ArrayList<>();
		
		for (Purchase p : buyer.getPurchases()) {
			if(p.getPurchaseStatus().getId() == 5) {
				purchasesPending.add(p);
			}
		}
		for (Purchase p : purchasesPending) {
			for (Inventory in : p.getInventory()) {
				total += in.getItem().getPrice();
			}
		}
		System.out.println("**** TOTAL for Pending purchases ****  " + total);
		model.addAttribute("total", total);
		return "cart";
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
	@RequestMapping(path = "getProfile.do")
	public String getUserProfile(Model model, User user, HttpSession session) {
		String error = "Issue returning results. Please try again.";
		User u = (User)session.getAttribute("user");
		if (u != null) {
		session.setAttribute("user", u);
		String role = u.getRole().toString();
		if (role.equals("BUYER")) {
			Buyer buyer = d.getBuyerByUserId(u.getId());
			if (b.getAllPurchases(buyer) != null) {
				model.addAttribute("purchases", b.getAllPurchases(buyer));
				session.setAttribute("buyer", buyer);
				model.addAttribute(buyer);
				return "buyerLoggedIn";
			} else {
				model.addAttribute("error", error);
				return "buyerLoggedIn";
			}
		} else if (role.equals("SELLER")) {
			Seller seller = d.getSellerByUserId(u.getId());
			if (sDAO.getInventoryItemsQtyBySeller(seller.getId()) != null) {
//				if (iDao.getSellerInventory(seller) != null) {
//				model.addAttribute("inventory", iDao.getSellerInventory(seller));
				model.addAttribute("invSummary", sDAO.getInventoryItemsQtyBySeller(seller.getId()));
				session.setAttribute("seller", seller);
				model.addAttribute(seller);
				return "sellerLoggedIn";
			}else {
				model.addAttribute("error", error);
				return "buyerLoggedIn";
			}
		} else if (role.equals("DRIVER")) {
			return "driverLoggedIn";
		} else if (role.equals("ADMIN")) {
			return "adminLoggedIn";
		} else {
			return "index";
		}
		} else {
			model.addAttribute("error", error);
		return "login";
		}
	}
	
	

}
