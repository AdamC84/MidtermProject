package com.skilldistillery.midterm.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.BuyerDAO;
import com.skilldistillery.midterm.data.ItemDAO;
import com.skilldistillery.midterm.data.UserDAO;
import com.skilldistillery.midterm.entities.Buyer;
import com.skilldistillery.midterm.entities.Purchase;

@Controller
public class BuyerController {
	@Autowired
	private BuyerDAO bd;
	@Autowired
	private ItemDAO i;
	@Autowired
	UserDAO uDao;

	@RequestMapping(path = "purchaseResults.do")
	public ModelAndView getPurchaseResults(Buyer buyer) {
		ModelAndView mv = new ModelAndView();

		List<Purchase> purchases = bd.getAllPurchases(buyer);
		mv.addObject("purchasesList", purchases);
		mv.setViewName("purchaseResults");

		return mv;
	}

	@RequestMapping(path = "purchase.do")
	public ModelAndView getPurchaseResults(int id) {
		ModelAndView mv = new ModelAndView();

		Purchase purchase = bd.getPurchase(id);
		mv.addObject("purchasesList", purchase);
		mv.setViewName("purchaseResults");

		return mv;
	}
	
	@RequestMapping(path = "checkout.do")
	public String checkout(Model model, HttpSession session,@RequestParam("total") double total) {
		
		model.addAttribute("sum", total);
		
		return "ordersummary";
	}
	
	@RequestMapping(path = "submitOrder.do")
	public String submitOrder(Model model, HttpSession session, @RequestParam("sum") double sum) {
		Buyer buyer = uDao.getBuyerById(((Buyer) session.getAttribute("buyer")).getId());
		List<Purchase> purchases = i.getPurchaseByBuyerId(buyer.getId());
		for (Purchase purchase : purchases) {
			purchase.getPurchaseStatus().setStatus("Fulfilled");
			buyer.addPurchase(purchase);
			System.out.println(purchase);
		}
		buyer = uDao.updateBuyer(buyer);
		return "buyerLoggedIn";
	}
}
//	@RequestMapping(path = "logout.do")
//	public ModelAndView logout(HttpSession session) {
//		ModelAndView mv = new ModelAndView();
//		session.removeAttribute("user"); 
//		mv.setViewName("index");
//		return mv;
//	}
//	@RequestMapping(path = "registerPage.do")
//	public ModelAndView register() {
//		ModelAndView mv = new ModelAndView();
//		User u = new User();
//		mv.addObject("user", u);
//		mv.setViewName("register");
//		return mv;
//	}
//	@RequestMapping(path = "registerUser.do", method = RequestMethod.POST)
//	public String register( Model model, User user, HttpSession session) {
//		user = d.addUser(user);
//		d.addAddress(user.getAddress());
//		model.addAttribute(user);
//		session.setAttribute("user", user);
//		String role = user.getRole().toString();
//		if(role.equals("BUYER")) {
//			return "buyerLoggedIn";
//		}else if(role.equals("SELLER")) {
//			return "sellerLoggedIn";
//		}else if(role.equals("DRIVER")) {
//			return "driverLoggedIn";
//		}else if(role.equals("ADMIN")) {
//			return "adminLoggedIn";
//		}else {
//			return "index";
//		}
//	}

//}
