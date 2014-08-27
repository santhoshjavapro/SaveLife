package com.SaveLife.controller;

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
import com.SaveLife.model.ResponseBody;

@RestController
@RequestMapping("/Login")
public class Login {
	@RequestMapping(method=RequestMethod.POST, headers="Accept=application/json")
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
						rs.setMessage("Login Succesful");
					}
				}
			}
		} 
		return rs;
	}
}
