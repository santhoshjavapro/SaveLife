package com.SaveLife.controller;

import java.util.List;

import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.SaveLife.Utility.Persistent;
import com.SaveLife.model.Donor;
import com.SaveLife.model.ResponseBody;

@RestController
@RequestMapping("/home")
public class HomeController {
	@RequestMapping(value="/getblood", method=RequestMethod.GET, headers = "Accept=application/json")
	public ResponseBody<Donor> search(@RequestParam(value="bgroup") String bgroup) {
		ResponseBody<Donor> rs = new ResponseBody<Donor>();
		rs.setMessage("Search Failed");
		if (!StringUtils.isEmpty(bgroup)) {
			MongoOperations mongoOps = Persistent.getMongoOps();
			Query searchUserQuery = new Query(Criteria.where("bgroup").is(bgroup));
			if (searchUserQuery != null) {
				List<Donor> donors = mongoOps.find(searchUserQuery, Donor.class);
				if (donors != null) {
					rs.setObject(donors);
					rs.setMessage("Search Success");
				}
			}
		}
		return rs;
	}
}
