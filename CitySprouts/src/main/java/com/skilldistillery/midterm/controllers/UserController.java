package com.skilldistillery.midterm.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.UserDAO;
import com.skilldistillery.midterm.entities.User;

@Controller
public class UserController {

	@Autowired
	UserDAO d;
	
	
	@RequestMapping(path = "home.do")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping(path = "cart.do")
	public ModelAndView cart() {
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("cart");
		return mv;
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
	public ModelAndView edit() {
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("editProfile");
		return mv;
	}
	
	@RequestMapping(path = "getDrivers.do")
	public ModelAndView getAllUsers() {
		ModelAndView mv = new ModelAndView();
		List<User> user = d.getAllUsers();
		
		mv.addObject("users", user);
		mv.setViewName("index");
		return mv;
	}

}
