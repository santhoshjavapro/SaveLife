package com.SaveLife.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@EnableWebMvc
@Document(collection = "Credential")
public class Credential {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	String donor_id;
	String username;
	String password;
	
	public Credential() {}
	
	public Credential(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	public Credential(String donor_id, String username, String password) {
		super();
		this.donor_id = donor_id;
		this.username = username;
		this.password = password;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getDonor_id() {
		return donor_id;
	}

	public void setDonor_id(String donor_id) {
		this.donor_id = donor_id;
	}
	
}
