package com.SaveLife.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.SaveLife.Utility.Utility;
import com.SaveLife.model.Donor;
import com.SaveLife.model.ResponseBody;

@RestController
@RequestMapping("/home")
public class HomeController {
	@RequestMapping(value="/getblood", method=RequestMethod.GET, headers = "Accept=application/json")
	public ResponseBody<Donor> search(@RequestParam(value="bgroup") String bgroup, @RequestParam(value="city") String city) {
		ResponseBody<Donor> rs = new ResponseBody<Donor>();
		rs.setMessage("Search Failed");
		List<Donor> donorElements;
		MongoOperations mongoOps = Utility.getMongoOps();
		if (!StringUtils.isEmpty(city) && !StringUtils.isEmpty(bgroup)) {
			List<Donor> donorByTwoColumn = getDonorByTwoColumn("bgroup", bgroup, "city", city);
			rs.setMessage("Both Not empty scenario needs to be handled");
			rs.setObject(donorByTwoColumn);
			rs.setMessage("Search Success");
			if (donorByTwoColumn == null) {
				rs.setMessage("Search returned 0 Results");
			}
		}  else if (!StringUtils.isEmpty(bgroup)) {
			List<Donor> donorByOneColumn = getDonorByOneColumn("bgroup", bgroup);
			rs.setObject(donorByOneColumn);
			rs.setMessage("Search Success");
			if (donorByOneColumn == null) {
				rs.setMessage("Search returned 0 Results");
			}
		} /*else if (!StringUtils.isEmpty(city)) {
			donorElements = getDonorElements("city", city);	
			rs.setObject(donorElements);
			rs.setMessage("Search Success");
		}*/
		
		return rs;
	}
	
	public List<Donor> getDonorByTwoColumn(String columnOneName, String searchOneString, String columnTwoName, String searchTwoString) {
		Criteria criteriaOne = new Criteria().where(columnOneName).is(searchOneString);
		Criteria criteriaTwo = new Criteria().where(columnTwoName).is(searchTwoString);
		Criteria criteriaOr = new Criteria().andOperator(criteriaOne, criteriaTwo);
		Query query = Query.query(criteriaOr);
		MongoOperations mongoOps = Utility.getMongoOps();
		List<Donor> donors = mongoOps.find(query, Donor.class);
		if (donors != null) {
			return donors;
		}
		return null;
	}
	
	public List<Donor> getDonorByOneColumn(String columnName, String searchString) {
		Query query = new Query(new Criteria().where(columnName).is(searchString));
		MongoOperations mongoOps = Utility.getMongoOps();
		List<Donor> donors = mongoOps.find(query, Donor.class);
		if (donors != null) {
			return donors;
		}
		return null;
	}
	
	@RequestMapping(value="/getCities", method=RequestMethod.GET)
	public ResponseBody<String> getCitiies() {
		ResponseBody<String> rs = new ResponseBody<String>();
		rs.setMessage("No Donors available");
		List<Donor> donors = Utility.getAllDonors();
		Set<String> citiesSet = new HashSet<String>();
		List<String> citiesList = new ArrayList<String>();
		if (donors != null) {
			for (Donor donor : donors) {
				if (!StringUtils.isEmpty(donor.getCity())) {
					citiesSet.add(Utility.CapitalizeIndex(donor.getCity()));
				}
			}
			rs.setMessage("Donors are available");
		}
		citiesList.addAll(citiesSet);
		Collections.sort(citiesList);
		rs.setObject(citiesList);
		return rs;
	}
}


