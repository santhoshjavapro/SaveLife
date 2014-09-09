package com.SaveLife.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.SaveLife.Utility.Utility;
import com.SaveLife.model.Credential;
import com.SaveLife.model.Donor;
import com.SaveLife.model.ResponseBody;

@RestController
@RequestMapping("/User")
public class UserController {

	@RequestMapping(value="/login", method=RequestMethod.POST, headers="Accept=application/json")
	public ResponseBody<Credential> login(@RequestBody Credential credential) {
		ResponseBody<Credential> rs = new ResponseBody<Credential>();
		rs.setMessage("Login Failed");

		String username = credential.getUsername();
		String password = credential.getPassword();

		if(!StringUtils.isEmpty(username)) {
			MongoOperations mongoOps = Utility.getMongoOps();
			Query searchUserQuery = new Query(Criteria.where("username").is(username));
			if (searchUserQuery != null) {
				Credential localCredential = mongoOps.findOne(searchUserQuery, Credential.class);
				if (localCredential != null) {
					System.out.println("localCredential1 "+localCredential.getUsername());
					System.out.println("localCredential2 "+localCredential.getPassword());

					String dbname = localCredential.getUsername();
					String dbpass = localCredential.getPassword();
					if (!StringUtils.isEmpty(dbname) && username.equals(dbname) && !StringUtils.isEmpty(dbpass) && password.equals(dbpass)) {
						rs.setCode(localCredential.getDonor_id());
						
						rs.setObject(Arrays.asList(credential));
						rs.setMessage("Login Succesful");
					}
				}
			}
		} 
		return rs;
	}

	@RequestMapping(value="/signup", method=RequestMethod.POST, headers="Accept=application/json")
	public ResponseBody<Donor> signup(@RequestBody Donor donor) {
		ResponseBody<Donor> rs = new ResponseBody<Donor>();
		rs.setMessage("SignUp Failed");
		try {
			
			MongoOperations mongoOps = Utility.getMongoOps();
			long count = mongoOps.count(null, Donor.class);
			int size = (int) count;
			size++;
			System.out.println("size "+size);
			donor.setDonor_id(String.valueOf(size));
			if (!StringUtils.isEmpty(donor.getUsername()) && !StringUtils.isEmpty(donor.getPassword())) {
				
				Credential credential = new Credential (donor.getDonor_id(), donor.getUsername(), donor.getPassword());
				mongoOps.save(credential);
			}
			mongoOps.save(donor);
			rs.setMessage("SignUp Success");
		} catch (Exception e) {
			rs.setMessage(e.getLocalizedMessage());
		}
		return rs;
	}
	
	@RequestMapping(value="/validateuser", method=RequestMethod.GET)
	public ResponseBody<Donor> validateusername(@RequestParam("username") String username) {
		ResponseBody<Donor> rs = new ResponseBody<Donor>();
		rs.setMessage("Username does not exists");
		List<Donor> donors = Utility.getDonorsByOneColumn("username", username, false);
		if (!CollectionUtils.isEmpty(donors)) {
			rs.setObject(donors);
			rs.setMessage("Username Already Exists");
		}
		return rs;
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	public ResponseBody<Donor> getDonor(@RequestParam("code") String usercode) {
		ResponseBody<Donor> rs = new ResponseBody<Donor>();
		rs.setMessage("Fetching Details Failed");
		List<Donor> donor = Utility.getDonorsByOneColumn("_id", usercode, false);
		if (donor != null) {
			rs.setObject(donor);
			rs.setMessage("Donor Details Fetched");
		}
		return  rs;
	}
}
