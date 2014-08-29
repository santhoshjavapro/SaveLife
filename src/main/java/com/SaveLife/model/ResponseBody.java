package com.SaveLife.model;

import java.util.List;

public class ResponseBody<T> {
	
	List<T> object;
	String message;
	String code;
	
	public ResponseBody() {}

	public ResponseBody(List<T> object, String message, String code) {
		super();
		this.object = object;
		this.message = message;
		this.code = code;
	}

	public List<T> getObject() {
		return object;
	}

	public void setObject(List<T> object) {
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
