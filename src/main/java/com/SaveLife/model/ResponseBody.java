package com.SaveLife.model;

import org.json.simple.JSONObject;

public class ResponseBody {
	JSONObject object;
	String message;
	String code;
	
	public ResponseBody() {}
	
	public ResponseBody(JSONObject object, String message, String code) {
		super();
		this.object = object;
		this.message = message;
		this.code = code;
	}

	public JSONObject getObject() {
		return object;
	}

	public void setObject(JSONObject object) {
		this.object = object;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
