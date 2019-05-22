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
import com.skilldistillery.midterm.data.SellerDAO;
import com.skilldistillery.midterm.data.UserDAO;
import com.skilldistillery.midterm.entities.Buyer;
import com.skilldistillery.midterm.entities.Category;
import com.skilldistillery.midterm.entities.Inventory;
import com.skilldistillery.midterm.entities.Item;
import com.skilldistillery.midterm.entities.Purchase;
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
	@Autowired
	SellerDAO sDAO;

	
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
		List<Inventory> inventory = new ArrayList<Inventory>();
		inventory = itemDao.getSellerInventory(seller);
		
		if (qty != 0) {
			for (int i = 1; i < qty; i ++) {
			Inventory inv = itemDao.addItemToInventory(item, seller);
			inventory.add(inv);
			System.out.println("adding to inventory");
			}
		} else {
			model.addAttribute("error", "A quantity must be entered");
			return "sellerLoggedIn";
		}
		seller.setInventory(inventory);
		seller = d.updateSeller(seller);
		if (sDAO.getInventoryItemsQtyBySeller(seller.getId()) != null) {
			model.addAttribute("invSummary", sDAO.getInventoryItemsQtyBySeller(seller.getId()));
		}
//		model.addAttribute("invSummary", inventory);
		List<Unit> u = itemDao.getAllUnits();
		List<Category> c = itemDao.getAllCategory();
		model.addAttribute(u);
		model.addAttribute(c);

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
		i.setActive(0);
		
		Purchase purchase = new Purchase();
		if(session.getAttribute("purchase") == null) {
			purchase.setBuyer(buyer);
			purchase.setPurchaseStatus(itemDao.getPurchaseStatusById(5));
			purchase = itemDao.addPurchase(purchase);
			session.setAttribute("purchase", purchase);
		}else {
			purchase = itemDao.getPurchaseById(( (Purchase) session.getAttribute("purchase")).getId());
		}
		
		System.out.println(purchase.getPurchaseStatus());
		Inventory inventory = itemDao.getInventoryByItemId(i.getId());
		purchase.addInventory(inventory);
		buyer.addPurchase(purchase);
		buyer = d.updateBuyer(buyer);
		System.out.println(buyer);
		double total = 0;
		
			for (Inventory in : purchase.getInventory()) {
				total += in.getItem().getPrice();
			}
		
		System.out.println("**** TOTAL ****  " + total);
		mv.addObject("total", total);
		session.setAttribute("buyer", buyer);
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
