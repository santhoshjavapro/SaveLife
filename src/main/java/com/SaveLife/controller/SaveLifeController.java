package com.SaveLife.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.SaveLife.model.Donor;

@RestController
@RequestMapping("/Controller")
public class SaveLifeController {
	@RequestMapping( method= RequestMethod.GET, headers="Accept=application/json")
	public Donor getFirstApp() {
		return new Donor("1", "Santhosh", "O positive", "9962678306");
	}
}
