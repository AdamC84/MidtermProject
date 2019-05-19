package com.skilldistillery.midterm.controllers;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.UserDAO;
import com.skilldistillery.midterm.entities.User;

@Controller
public class LoginController {

	@Autowired
	UserDAO d;
	
	@RequestMapping(path = "login.do")
	public ModelAndView login(String username, String password, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User u = d.login(username, password);
		session.setAttribute("user", u);
		mv.setViewName("index");
		return mv;
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
	public String register( Model model, User user) {
		user = d.addUser(user);
		d.addAddress(user.getAddress());
		model.addAttribute(user);
		System.out.println(user);
		return "buyerLoggedIn";
	}
	
}

