package com.skilldistillery.midterm.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.midterm.data.BuyerDAO;
import com.skilldistillery.midterm.data.ItemDAO;
import com.skilldistillery.midterm.data.SellerDAO;
import com.skilldistillery.midterm.data.UserDAO;
import com.skilldistillery.midterm.entities.Buyer;
import com.skilldistillery.midterm.entities.Driver;
import com.skilldistillery.midterm.entities.Inventory;
import com.skilldistillery.midterm.entities.Purchase;
import com.skilldistillery.midterm.entities.Seller;
import com.skilldistillery.midterm.entities.User;

@Controller
public class LoginController {

	@Autowired
	UserDAO d;
	@Autowired
	BuyerDAO b;
	@Autowired
	ItemDAO itemDAO;
	@Autowired
	SellerDAO sDAO;

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public ModelAndView login(String username, String password, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		System.out.println("**********************"+username + " " + password);
		User u = null;
		try {
			u = d.login(username, password);
		} catch (Exception e) {
			
			mv.addObject("error", "Error. Invalid credentials" );
			mv.setViewName("login");
			return mv;
		}
		if (u != null) {
		u.setLastLogin(new Date());
		session.setAttribute("user", u);
		System.out.println(u);
		String role = u.getRole().toString();
		if (role.equals("BUYER")) {
			Buyer buyer = d.getBuyerByUserId(u.getId());
			List<Purchase> fulfilled = new ArrayList<>();
			Inventory[] inv = itemDAO.getAllInventory();
			if (b.getAllPurchases(buyer) != null) {
				List<Purchase> purchases = b.getAllPurchases(buyer);
				for (Purchase purchase : purchases) {
					if(purchase.getPurchaseStatus().getStatus().equals("Fulfilled")) {
						fulfilled.add(purchase);
					}
				}
				
				mv.addObject("fulfilled", fulfilled);
			}
			session.setAttribute("buyer", buyer);
			mv.addObject(buyer);
			mv.addObject("inventory", inv);
			mv.setViewName("buyerLoggedIn");
			return mv;
		} else if (role.equals("SELLER")) {
			Seller s = d.getSellerByUserId(u.getId());
			session.setAttribute("seller", s);
			Seller seller = d.getSellerByUserId(u.getId());
			if (sDAO.getInventoryItemsQtyBySeller(seller.getId()) != null) {
//				if (iDao.getSellerInventory(seller) != null) {
//				model.addAttribute("inventory", iDao.getSellerInventory(seller));
				mv.addObject("invSummary", sDAO.getInventoryItemsQtyBySeller(seller.getId()));
			//			if (itemDAO.getSellerInventory(seller) != null) {
//				mv.addObject("inventory", itemDAO.getSellerInventory(seller));
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
	public String login(Model model, HttpSession session) {
		User user =(User) session.getAttribute("user");
		String role;
		try {
			role = user.getRole().toString();
		} catch (Exception e) {
			return "login";
		}
		if(role.equals("BUYER")) {
			
			return "buyerLoggedIn";
		}else if(role.equals("SELLER")) {
			return "sellerLoggedIn";
		}else
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
		session.removeAttribute("buyer");
		session.removeAttribute("seller");
		
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
		seller.getUser().setAddress(seller.getUser().getAddress());
	
		
		d.addAddress(user.getAddress());
		seller.setActive(1);
		session.setAttribute("seller", seller);
		seller = d.addSeller(seller);

		redir.addFlashAttribute(seller);
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
	
	
	@RequestMapping(path = "updateSeller.do", method = RequestMethod.POST)
	public String updateSeller(Seller seller, Model model, RedirectAttributes redir, HttpSession session) {
		System.out.println(seller);
		User user = (User) session.getAttribute("user");
		Seller seller1 = (Seller) session.getAttribute("seller");
		seller.getUser().setId(user.getId());
		seller.getUser().getAddress().setId(user.getAddress().getId());
		user.setAddress(d.updateAddress(seller.getUser().getAddress()));
		seller.setUser(d.updateUser(seller.getUser()));
		seller.setId(seller1.getId());
		seller = d.updateSeller(seller);
		
		
		
		return "sellerLoggedIn";
	}
	@RequestMapping(path = "updateBuyer.do", method = RequestMethod.POST)
	public String updateBuyer(Buyer buyer, Model model, RedirectAttributes redir, HttpSession session) {
		System.out.println(buyer);
		User user = (User) session.getAttribute("user");
		Buyer buyer1 = (Buyer) session.getAttribute("buyer");
		System.out.println("IN UPDATEBUYER.DO    **    "+user);
		buyer.getUser().setId(user.getId());
		buyer.setId(buyer1.getId());
		System.out.println("********"+buyer);
		buyer.getUser().getAddress().setId(user.getAddress().getId());
		user.setAddress(d.updateAddress(buyer.getUser().getAddress()));
		buyer.setUser(d.updateUser(buyer.getUser()));
		buyer = d.updateBuyer(buyer);
		System.out.println("********"+buyer);
		
		
		
		return "buyerLoggedIn";
	}

	@RequestMapping(path = "registerDriver.do")
	public String registerDriver(Driver driver, HttpSession session, Model model) {
		driver = d.addDriver(driver);
		session.setAttribute("user", driver);
		model.addAttribute("driver", driver);

		return "driverLoggedIn";
	}
}
