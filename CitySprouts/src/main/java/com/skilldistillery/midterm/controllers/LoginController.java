package com.skilldistillery.midterm.controllers;


import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.ItemDAO;
import com.skilldistillery.midterm.data.UserDAO;
import com.skilldistillery.midterm.entities.Buyer;
import com.skilldistillery.midterm.entities.Driver;
import com.skilldistillery.midterm.entities.Seller;
import com.skilldistillery.midterm.entities.User;

@Controller
public class LoginController {

	@Autowired
	UserDAO d;
	@Autowired
	ItemDAO itemDAO;
	
	@RequestMapping(path = "login.do")
	public ModelAndView login(String username, String password, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User u = d.login(username, password);
		u.setLastLogin(new Date());
		session.setAttribute("user", u);
		String role = u.getRole().toString();
		if(role.equals("BUYER")) {
			mv.setViewName("buyerLoggedIn");
			return mv;
		}else if(role.equals("SELLER")) {
			Seller seller = d.getSellerByUserId(u.getId());
			mv.addObject("inventory", itemDAO.getSellerInventory(seller));
			mv.setViewName("sellerLoggedIn");
			return mv;
		}else if(role.equals("DRIVER")) {
			mv.setViewName("driverLoggedIn");
			return mv;
		}else if(role.equals("ADMIN")) {
			mv.setViewName("adminLoggedIn");
			return mv;
		}else {
			mv.setViewName("index");
			return mv;
		}
	}
	@RequestMapping(path = "logout.do")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.removeAttribute("user"); 
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping(path = "registerPage.do")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();
		User u = new User();
		mv.addObject("user", u);
		mv.setViewName("register");
		return mv;
	}
	@RequestMapping(path = "registerUser.do", method = RequestMethod.POST)
	public String register( Model model, User user, HttpSession session) {
		user = d.addUser(user);
		d.addAddress(user.getAddress());
		model.addAttribute(user);
		session.setAttribute("user", user);
		String role = user.getRole().toString();
		if(role.equals("BUYER")) {
			Buyer b = new Buyer();
			b.setUser(user);
			model.addAttribute("buyer",b);
			return "registerBuyer";
		}else if(role.equals("SELLER")) {
			Seller s = new Seller();
			s.setUser(user);
			model.addAttribute("seller",s);
			return "registerSeller";
		}else if(role.equals("DRIVER")) {
			Driver d = new Driver();
			d.setUser(user);
			model.addAttribute("driver",d);
			return "registerDriver";
		}else if(role.equals("ADMIN")) {
			return "adminLoggedIn";
		}else {
			return "index";
		}
	}
	
	@RequestMapping(path="registerSeller.do", method = RequestMethod.POST)
	public String registerUser(Seller seller, Model model) {
		
		seller = d.addSeller(seller);
		model.addAttribute("seller", seller);
		return "sellerLoggedIn";
	}
	@RequestMapping(path="registerBuyer.do")
	public String registerBuyer(Buyer buyer, HttpSession session, Model model) {
		buyer = d.addBuyer(buyer);
		session.setAttribute("user", buyer);
		model.addAttribute("buyer", buyer);
		
		return "buyerLoggedIn";
	}
	@RequestMapping(path="registerDriver.do")
	public String registerDriver(Driver driver, HttpSession session, Model model) {
		driver = d.addDriver(driver);
		session.setAttribute("user", driver);
		model.addAttribute("driver", driver);
		
		
		return "driverLoggedIn";
	}
}

