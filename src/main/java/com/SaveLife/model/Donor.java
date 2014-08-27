package com.SaveLife.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;


@Document(collection = "Donor")
public class Donor implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	String donor_id;
	String Name;
	String btype;
	String gender;
	String dob;
	
	String Address;
	String email_id;
	String contact_no;
	String alternate_contact_no;
	String availability;
	
	String username;
	String password;
	
	String height;
	String weight;
	String last_donated_date;
	String health_issues;
	String health_issues_desc;
	
	public Donor(String donor_id, String name, String btype, String contact_no) {
		super();
		this.donor_id = donor_id;
		Name = name;
		this.btype = btype;
		this.contact_no = contact_no;
	}
	
	public String getDonor_id() {
		return donor_id;
	}
	public void setDonor_id(String donor_id) {
		this.donor_id = donor_id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getBtype() {
		return btype;
	}
	public void setBtype(String btype) {
		this.btype = btype;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getContact_no() {
		return contact_no;
	}
	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}
	public String getAlternate_contact_no() {
		return alternate_contact_no;
	}
	public void setAlternate_contact_no(String alternate_contact_no) {
		this.alternate_contact_no = alternate_contact_no;
	}
	public String getAvailability() {
		return availability;
	}
	public void setAvailability(String availability) {
		this.availability = availability;
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
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getLast_donated_date() {
		return last_donated_date;
	}
	public void setLast_donated_date(String last_donated_date) {
		this.last_donated_date = last_donated_date;
	}
	public String getHealth_issues() {
		return health_issues;
	}
	public void setHealth_issues(String health_issues) {
		this.health_issues = health_issues;
	}
	public String getHealth_issues_desc() {
		return health_issues_desc;
	}
	public void setHealth_issues_desc(String health_issues_desc) {
		this.health_issues_desc = health_issues_desc;
	}
}
