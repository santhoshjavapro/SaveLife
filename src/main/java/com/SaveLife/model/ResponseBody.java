package com.SaveLife.model;

import org.json.simple.JSONObject;

public class ResponseBody {
	JSONObject object;
	String message;
	String errorcode;
	
	public ResponseBody() {}
	
	public ResponseBody(JSONObject object, String message, String errorcode) {
		super();
		this.object = object;
		this.message = message;
		this.errorcode = errorcode;
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
	public String getErrorcode() {
		return errorcode;
	}
	public void setErrorcode(String errorcode) {
		this.errorcode = errorcode;
	}
}
