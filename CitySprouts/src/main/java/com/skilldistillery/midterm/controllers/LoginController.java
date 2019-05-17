package com.skilldistillery.midterm.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.midterm.data.UserDAO;

@Controller
public class LoginController {

	@Autowired
	UserDAO d;
}
