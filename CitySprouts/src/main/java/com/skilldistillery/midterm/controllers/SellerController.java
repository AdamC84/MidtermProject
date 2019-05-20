package com.skilldistillery.midterm.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.midterm.data.SellerDAO;
import com.skilldistillery.midterm.entities.Purchase;
import com.skilldistillery.midterm.entities.Seller;
@Controller
public class SellerController {
	@Autowired
	private SellerDAO sellDAO;

	@RequestMapping(path = "purchaseResults.do")
	public String getAllOrders(Model model, Seller seller) {
		List<Purchase> orders = sellDAO.getAllOrders(seller);
		model.addAttribute(orders);
			return "orderHistory";
		}

	@RequestMapping(path = "purchaseResults.do")
	public String getOrderById(Model model, int orderId) {
		Purchase order = (sellDAO.getOrder(orderId));
		model.addAttribute(order);
		return "orderHistory";
	}
	
	
	
	}