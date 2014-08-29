package com.SaveLife.controller;

import java.util.Iterator;
import java.util.List;

import org.json.simple.JSONObject;
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
				List<Donor> donors = mongoOps.findAll(Donor.class);
				/*if (donors != null) {
					for (Donor donor:donors) {
						if (donor != null && !StringUtils.isEmpty(donor.getBgroup())) {
							if (!bgroup.equalsIgnoreCase(donor.getBgroup())) {
								
							}
						}
					}
				}*/
				if (donors != null) {
					for (Iterator<Donor> it = donors.iterator(); it.hasNext(); ) {
						Donor donor = it.next();
						if (!bgroup.equalsIgnoreCase(donor.getBgroup())) {
							it.remove();
						} 
					}
					rs.setObject(donors);
					rs.setMessage("Search Success");
				}
			}
		}
		return rs;
	}
}
