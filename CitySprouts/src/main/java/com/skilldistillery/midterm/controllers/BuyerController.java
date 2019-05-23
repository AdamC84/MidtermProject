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
import com.skilldistillery.midterm.entities.Inventory;
import com.skilldistillery.midterm.entities.Purchase;
import com.skilldistillery.midterm.entities.PurchaseStatus;

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
	public String checkout(Model model, HttpSession session, @RequestParam("total") double total) {
		
		model.addAttribute("sum", total);
		
		return "ordersummary";
	}
	
	@RequestMapping(path = "submitOrder.do")
	public String submitOrder(Model model, HttpSession session, @RequestParam("sum") double sum) {
		Buyer buyer = uDao.getBuyerById(((Buyer) session.getAttribute("buyer")).getId());
		List<Purchase> purchases = i.getPurchaseByBuyerId(buyer.getId());
		for (Purchase purchase : purchases) {
			purchase.setPurchaseStatus(i.getPurchaseStatusById(4));
			buyer.addPurchase(purchase);
			PurchaseStatus pStatusFulfilled = i.getPurchaseStatusById(4);
			pStatusFulfilled.addPurchase(purchase);
			
			System.out.println(purchase);
		}
		buyer = uDao.updateBuyer(buyer);
		session.setAttribute("buyer", buyer);
		session.removeAttribute("purchase");
		System.out.println("***************     " + i.getPurchaseByBuyerId(buyer.getId()));
		purchases = i.getPurchaseByBuyerId(buyer.getId());
		for (Purchase purchase : purchases) {
			System.out.println("*** Buyer's Purchase Status: "+ purchase.getPurchaseStatus());
			
		}
		Inventory[] inv = i.getAllInventory();
		model.addAttribute("inventory", inv);
		System.out.println("GOING TO BUYER LOGGED IN PAGE *** ");
		return "buyerLoggedIn";
	}
}
