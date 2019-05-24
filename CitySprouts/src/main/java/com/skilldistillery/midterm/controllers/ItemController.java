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

	@RequestMapping(path = "addItem.do", method = RequestMethod.POST)
	public String addItem(Model model, Item item, HttpSession session, @RequestParam int qty,
			@RequestParam String picked_on, @RequestParam String best_by) {
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
		System.out.println(item.getCategory());
		int categoryId = itemDao.getCategoryIdByCategoryName(item.getCategory().getName());
		int unitId = itemDao.getUnitIdByUnitName(item.getUnit().getName());
		item.setCategory(itemDao.getCategoryByCategoryId(categoryId));
		item.setUnit(itemDao.getUnitByUnitId(unitId));
		item = itemDao.addItem(item, seller);
		model.addAttribute("seller", seller);
//		model.addAttribute("item", new Item());
		List<Inventory> inventory = new ArrayList<Inventory>();
		inventory = itemDao.getSellerInventory(seller);

		if (qty != 0) {
			for (int i = 0; i < qty; i++) {
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
		List<Item> purchased = new ArrayList<>();
		if (sDAO.getPendingInventoryItemsQtyBySeller(seller.getId()) != null) {

			model.addAttribute("invSummary", sDAO.getPendingInventoryItemsQtyBySeller(seller.getId()));
		}
		if (sDAO.getFulfilledInventoryItemsQtyBySeller(seller.getId()) != null) {
			model.addAttribute("fulFilled", sDAO.getFulfilledInventoryItemsQtyBySeller(seller.getId()));
		}
		session.setAttribute("purchases", purchased);
		Item item1 = null;
		model.addAttribute("item", item1);
//		List<Unit> u = itemDao.getAllUnits();
//		List<Category> c = itemDao.getAllCategory();
//		model.addAttribute(u);
//		model.addAttribute(c);

		return "sellerLoggedIn";
	}

	@RequestMapping(path = "search.do", method = RequestMethod.GET)
	public ModelAndView keywordSearch(String keyword) {
		ModelAndView mv = new ModelAndView();
		List<Inventory> items = itemDao.getItemsByKeyword(keyword);
		System.out.println(items);
		mv.addObject("items", items);
		mv.setViewName("searchResults");
		return mv;
	}

	@RequestMapping(path = "addToCart.do", method = RequestMethod.GET)
	public ModelAndView addItemToCart(@RequestParam("id") int id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		
		Buyer buyer = null;
		try {
			buyer = d.getBuyerById(((Buyer) session.getAttribute("buyer")).getId());
		} catch (Exception e) {
			mv.setViewName("login");
			return mv;
		}
		Purchase purchase = new Purchase();
		if (session.getAttribute("purchase") == null) {
			purchase.setBuyer(buyer);
			purchase.setPurchaseStatus(itemDao.getPurchaseStatusById(5));
			purchase = itemDao.addPurchase(purchase);
			session.setAttribute("purchase", purchase);
		} else {
			purchase = itemDao.getPurchaseById(((Purchase) session.getAttribute("purchase")).getId());
		}

		System.out.println(purchase.getPurchaseStatus());
		System.out.println("**** Item ID : " + id);
		Item item = itemDao.getItemByInvetoryId(id);
		Seller seller = item.getSeller();
		Inventory inventory = itemDao.getInventoryItemBySellerIdAndItemId(seller.getId(), id);
		inventory.setItem(itemDao.getItemByItemId(item.getId()));
		inventory.setSeller(itemDao.getItemByItemId(item.getId()).getSeller());
		inventory.setPurchase(purchase);
		inventory = itemDao.addInventory(inventory);
		purchase.addInventory(inventory);
		purchase = itemDao.addPurchase(purchase);
		buyer.addPurchase(purchase);
		
		buyer = d.updateBuyer(buyer);
		System.out.println(buyer.getPurchases());
		double sum = 0;
		List<Purchase> purchasesPending = new ArrayList<>();
		
		try {
			for (Purchase p : buyer.getPurchases()) {
				if (p.getPurchaseStatus().getId() == 5) {
					purchasesPending.add(p);
				}
			}
			for (Purchase p : purchasesPending) {
				for (Inventory in : p.getInventory()) {
					sum += in.getItem().getPrice();
				}
			}
		} catch (Exception e) {
		}
//		double total = 0;
//
//		for (Inventory in : purchase.getInventory()) {
//			total += in.getItem().getPrice();
//		}
//		total += sum;
		System.out.println("**** TOTAL ****  " + sum);
		mv.addObject("total", sum);
		session.setAttribute("buyer", buyer);
		mv.addObject("buyer", buyer);
		mv.setViewName("cart");
		return mv;
	}

	@RequestMapping(path = "itemDetails.do", method = RequestMethod.GET)
	public ModelAndView itemDetails(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		Inventory i = itemDao.getInventoryById(id);
		System.out.println("*********" + i);
		
		mv.addObject("i", i);
		mv.setViewName("itemDetails");
		return mv;
	}

	@RequestMapping(path = "getItem.do", method = RequestMethod.POST)
	public String getItemById(Model model, Item item) {
		model.addAttribute(item);
		return "itemDetails";
	}

	@RequestMapping(path = "removeItem.do", method = RequestMethod.GET)
	public String removeItemByInventoryId(Model model, int id, HttpSession session) {
		Inventory inventory = itemDao.getInventoryById(id);
		Buyer buyer = (Buyer) session.getAttribute("buyer");
		List<Purchase> purchases = buyer.getPurchases();
		for (Purchase purchase : purchases) {
//			System.out.println(purchase.getInventory());
			for (int i = 0; i < purchase.getInventory().size(); i++) {
				if (purchase.getInventory().get(i).getId()== inventory.getId()) {
					inventory = purchase.getInventory().get(i);
					inventory.setPurchase(null);
					System.out.println("********" + inventory);
					inventory = itemDao.updateInventory(inventory);
					purchase.removeInventory(purchase.getInventory().get(i));
				}

			}
//			inventory.getPurchase().setPurchaseStatus(null);
		}
		double sum = 0;
		List<Purchase> purchasesPending = new ArrayList<>();

		try {
			for (Purchase p : buyer.getPurchases()) {
				if (p.getPurchaseStatus().getId() == 5) {
					purchasesPending.add(p);
				}
			}
			for (Purchase p : purchasesPending) {
				for (Inventory in : p.getInventory()) {
					sum += in.getItem().getPrice();
				}
			}
		} catch (Exception e) {
		}
		buyer = d.updateBuyer(buyer);
		System.out.println("**** TOTAL ****  " + sum);
		session.setAttribute("buyer", buyer);
		model.addAttribute("total", sum);
		return "cart";

	}
}
