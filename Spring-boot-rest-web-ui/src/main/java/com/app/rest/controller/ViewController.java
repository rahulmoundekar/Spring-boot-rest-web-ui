package com.app.rest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

	@GetMapping("/")
	public String viewHome() {
		System.out.println("index page");
		return "index";
	}
}
