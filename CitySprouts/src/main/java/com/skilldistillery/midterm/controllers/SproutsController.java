package com.skilldistillery.midterm.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.midterm.data.SproutsDAO;
import com.skilldistillery.midterm.entities.User;

@Controller
public class SproutsController {

	@Autowired
	SproutsDAO d;
	
	
	@RequestMapping()
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/index.jsp");
		return mv;
	}
	@RequestMapping(path = "getDrivers.do")
	public ModelAndView getAllUsers() {
		ModelAndView mv = new ModelAndView();
		List<User> user = d.getAllUsers();
		
		mv.addObject("users", user);
		mv.setViewName("WEB-INF/index.jsp");
		return mv;
	}
}
