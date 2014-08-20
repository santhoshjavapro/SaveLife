package com.FirstApp.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/FirstApp")
public class FirstAppController {
	@RequestMapping(value = "/{name}", method= RequestMethod.GET)
	public String getFirstApp(@PathVariable String name) {
		return "Hello "+name;
	}
}
