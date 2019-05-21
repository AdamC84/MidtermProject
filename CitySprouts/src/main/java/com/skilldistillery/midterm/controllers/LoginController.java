package com.skilldistillery.midterm.controllers;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public ModelAndView login(String username, String password, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		System.out.println("**********************"+username + " " + password);
		User u = d.login(username, password);
		if (u != null) {
		u.setLastLogin(new Date());
		session.setAttribute("user", u);
		String role = u.getRole().toString();
		if (role.equals("BUYER")) {
			mv.setViewName("buyerLoggedIn");
			return mv;
		} else if (role.equals("SELLER")) {
			Seller seller = d.getSellerByUserId(u.getId());
			if (itemDAO.getSellerInventory(seller) != null) {
				mv.addObject("inventory", itemDAO.getSellerInventory(seller));
			}
			session.setAttribute("seller", seller);
			mv.addObject(seller);
			mv.setViewName("sellerLoggedIn");
			return mv;
		} else if (role.equals("DRIVER")) {
			mv.setViewName("driverLoggedIn");
			return mv;
		} else if (role.equals("ADMIN")) {
			mv.setViewName("adminLoggedIn");
			return mv;
		} else {
			mv.setViewName("index");
			return mv;
		}
		} else {
			mv.addObject("error", "Login failed, please try again.");
			return mv;
		}
	}

	@RequestMapping(path = "login")
	public String login(Model model) {
		return "login";
	}
	@RequestMapping(path = "about")
	public String about(Model model) {
		return "about";
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
	public String register(Model model, User user, HttpSession session, RedirectAttributes redir) {
		System.out.println("first registeruser.do       " + user);
		user = d.addUser(user);
		d.addAddress(user.getAddress());
		System.out.println("second registeruser.do       " + user);
		model.addAttribute(user);
		session.setAttribute("user", user);
		String role = user.getRole().toString();
		if (role.equals("BUYER")) {
			Buyer b = new Buyer();
			b.setUser(user);
			model.addAttribute("buyer", b);
			return "redirect:buyerCreated.do";
		} else if (role.equals("SELLER")) {
			redir.addFlashAttribute("user", user);
			return "redirect:sellerCreated.do";
		} else if (role.equals("DRIVER")) {
			Driver d = new Driver();
			d.setUser(user);
			model.addAttribute("driver", d);
			return "registerDriver";
		} else if (role.equals("ADMIN")) {
			return "adminLoggedIn";
		} else {
			return "index";
		}
	}

	@RequestMapping(path = "sellerCreated.do", method = RequestMethod.GET)
	public String redirectSeller(Model model) {
		Seller s = new Seller();
		model.addAttribute("seller", s);

		return "registerSeller";
	}

	@RequestMapping(path = "registerSeller.do", method = RequestMethod.POST)
	public String registerUser(Seller seller, Model model, RedirectAttributes redir, HttpSession session) {
		User user = (User) session.getAttribute("user");
		seller.setUser(user);
		seller.setActive(1);
		System.out.println("USER  ***** " + user);
		System.out.println("****" + seller);
		session.setAttribute("seller", seller);
		seller = d.addSeller(seller);

		redir.addFlashAttribute(seller);
		System.out.println("*************" + seller);
		return "redirect:sellerLoggedInView.do";
	}

	@RequestMapping(path = "sellerLoggedInView.do", method = RequestMethod.GET)
	public String registeredSeller(Model model, HttpSession session) {
		Seller seller = (Seller) session.getAttribute("seller");
		model.addAttribute("seller", seller);
		return "sellerLoggedIn";
	}

	@RequestMapping(path = "buyerLoggedInView.do", method = RequestMethod.GET)
	public String registeredBuyer(Model model, HttpSession session) {
		Buyer buyer = (Buyer) session.getAttribute("buyer");
		model.addAttribute("buyer", buyer);
		return "buyerLoggedIn";
	}


	@RequestMapping(path = "buyerCreated.do", method = RequestMethod.GET)
	public String redirectBuyer(Model model, Buyer buyer) {

		return "registerBuyer";
	}

	@RequestMapping(path = "registerBuyer.do", method = RequestMethod.POST)
	public String registerBuyer(Buyer buyer, RedirectAttributes redir, HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		buyer.setUser(user);
		buyer.setActive(1);
		buyer = d.addBuyer(buyer);
		model.addAttribute("buyer", buyer);

		System.out.println("USER  ***** " + user);
		System.out.println("****" + buyer);
		session.setAttribute("buyer", buyer);

		redir.addFlashAttribute(buyer);
		System.out.println("*************" + buyer);

		return "redirect:buyerLoggedInView.do";
	}

	@RequestMapping(path = "registerDriver.do")
	public String registerDriver(Driver driver, HttpSession session, Model model) {
		driver = d.addDriver(driver);
		session.setAttribute("user", driver);
		model.addAttribute("driver", driver);

		return "driverLoggedIn";
	}
}
