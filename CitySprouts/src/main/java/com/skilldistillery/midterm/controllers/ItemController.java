package com.skilldistillery.midterm.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.BuyerDAO;
import com.skilldistillery.midterm.data.ItemDAO;
import com.skilldistillery.midterm.data.UserDAO;
import com.skilldistillery.midterm.entities.Buyer;
import com.skilldistillery.midterm.entities.Category;
import com.skilldistillery.midterm.entities.Inventory;
import com.skilldistillery.midterm.entities.Item;
import com.skilldistillery.midterm.entities.Purchase;
import com.skilldistillery.midterm.entities.PurchaseStatus;
import com.skilldistillery.midterm.entities.Seller;
import com.skilldistillery.midterm.entities.Unit;

@Controller
public class ItemController {

	@Autowired
	private ItemDAO itemDao;
	@Autowired
	UserDAO d;
	@Autowired
	BuyerDAO b;

	
	@RequestMapping(path = "")
	public ModelAndView homePage() {
		ModelAndView mv = new ModelAndView();
		List<Item> randomList = itemDao.getAllItems();
		Collections.shuffle(randomList);
		List<Item> sortedByDate = itemDao.getItemsSortedByPickedDate();
		
		mv.addObject("random", randomList);
		mv.addObject("fresh", sortedByDate);
		
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping(path="addItem.do", method = RequestMethod.POST)
	public String addItem(Model model, Item item, HttpSession session, @RequestParam int qty,
				@RequestParam String picked_on, @RequestParam String best_by){
		System.out.println("Quantity: " + qty);
		Seller seller = (Seller) session.getAttribute("seller");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			item.setBestBy(format.parse(best_by));
			item.setPicked(format.parse(picked_on));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		item.setSeller(seller);
		item.setActive(1);
		item = itemDao.addItem(item, seller);
		model.addAttribute("seller",seller);
		model.addAttribute("item", new Item());
		
		
		if (qty != 0) {
			for (int i = 1; i < qty; i ++) {
			itemDao.addItemToInventory(item, seller);
			System.out.println("adding to inventory");
			}
		} else {
			model.addAttribute("error", "A quantity must be entered");
			return "sellerLoggedIn";
		}
		List<Inventory> inventory = new ArrayList<Inventory>();
		inventory = itemDao.getSellerInventory(seller);
		model.addAttribute("inventory", inventory);
		List<Unit> u = itemDao.getAllUnits();
		List<Category> c = itemDao.getAllCategory();
		model.addAttribute(u);
		model.addAttribute(c);
		//		System.out.println("Seller: **" + seller);
//		System.out.println("Session" + session.getAttribute("user"));
//		User currUser = (User) session.getAttribute("user");
//		System.out.println("User role: " + currUser.getRole());
//		System.out.println("ITEM *****  "+item);
		
//		System.out.println("****************"+item);
//		System.out.println("Cat:" + item.getCategory());

		return "sellerLoggedIn";
	}
	@RequestMapping(path="search.do", method = RequestMethod.GET)
	public ModelAndView keywordSearch(String keyword ){
		ModelAndView mv = new ModelAndView();
		List<Item> items = itemDao.getItemsByKeyword(keyword);
		System.out.println(items);
		mv.addObject("items", items);
		mv.setViewName("searchResults");
		return mv;
	}
	@RequestMapping(path="addToCart.do", method = RequestMethod.GET)
	public ModelAndView addItemToCart(@RequestParam("id")int id , HttpSession session){
		ModelAndView mv = new ModelAndView();
		Buyer buyer = d.getBuyerById(((Buyer) session.getAttribute("buyer")).getId());
		
		Item i = itemDao.getItemByItemId(id);

		Purchase purchase;
		try {
			purchase = itemDao.getPurchaseByBuyerId(buyer.getId()).get(0);
		} catch (Exception e) {
			 purchase = new Purchase();
		}
		PurchaseStatus ps = itemDao.getPurchaseStatusByName("Pending");
		purchase.setPurchaseStatus( ps);
		
		Inventory inventory = itemDao.getInventoryByItemId(i.getId());
		purchase.addInventory(inventory);
		buyer.addPurchase(purchase);
		buyer = d.updateBuyer(buyer);
		
		double total = 0;
		for (Purchase p : buyer.getPurchases()) {
			for (Inventory in : p.getInventory()) {
				total += in.getItem().getPrice();
			}
		}
		System.out.println("**** TOTAL ****  " + total);
		mv.addObject("total", total);
		
		mv.addObject("buyer", buyer);
		mv.setViewName("cart");
		return mv;
	}
	@RequestMapping(path="itemDetails.do", method = RequestMethod.GET)
	public ModelAndView itemDetails(@RequestParam("id")int id ){
		ModelAndView mv = new ModelAndView();
		Item i = itemDao.getItemByItemId(id);
		System.out.println("*********" + i);
		List<Item> items = new ArrayList<>();
		items.add(i);
		System.out.println("*******************" + items);
		mv.addObject("items", items);
		mv.setViewName("itemDetails");
		return mv;
	}
	@RequestMapping(path="getItem.do", method = RequestMethod.POST)
	public String getItemById(Model model, Item item){
		model.addAttribute(item);
		return "itemDetails";
	}
	
}
