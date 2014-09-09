package com.SaveLife.model;

import java.util.Collection;

public class ResponseBody<T> {
	
	Collection<T> object;
	String message;
	String code;
	boolean state;
	
	public ResponseBody() {}

	public ResponseBody(Collection<T> object, String message, String code,
			boolean state) {
		super();
		this.object = object;
		this.message = message;
		this.code = code;
		this.state = state;
	}

	public Collection<T> getObject() {
		return object;
	}

	public void setObject(Collection<T> object) {
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

	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	
	
}
