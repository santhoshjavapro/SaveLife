package com.SaveLife.controller;

import java.util.List;

import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.SaveLife.Utility.Persistent;
import com.SaveLife.model.Credential;
import com.SaveLife.model.Donor;
import com.SaveLife.model.ResponseBody;

@RestController
@RequestMapping("/User")
public class UserController {

	@RequestMapping(value="/login", method=RequestMethod.POST, headers="Accept=application/json")
	public ResponseBody login(@RequestBody Credential credential) {
		ResponseBody rs = new ResponseBody();
		rs.setMessage("Login Failed");

		String username = credential.getUsername();
		String password = credential.getPassword();

		if(!StringUtils.isEmpty(username)) {
			MongoOperations mongoOps = Persistent.getMongoOps();
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
						rs.setMessage("Login Succesful");
					}
				}
			}
		} 
		return rs;
	}

	@RequestMapping(value="/signup", method=RequestMethod.POST, headers="Accept=application/json")
	public ResponseBody signup(@RequestBody Donor donor) {
		ResponseBody rs = new ResponseBody();
		rs.setMessage("SignUp Failed");
		try {
			MongoOperations mongoOps = Persistent.getMongoOps();
			
			List<Donor> donors = mongoOps.findAll(Donor.class);
			int size = donors.size();
			System.out.println("donors.size() "+donors.size());
			
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
}
