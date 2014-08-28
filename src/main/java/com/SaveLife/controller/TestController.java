package com.SaveLife.controller;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/test")
public class TestController {
	@RequestMapping(method=RequestMethod.GET, headers="Accept=application/json")
	public JSONObject getHello() {
		JSONObject js = new JSONObject();
		js.put("Key", "value");
		return js;
	}
}
