package com.SaveLife.Utility;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.util.StringUtils;

import com.SaveLife.config.SpringMongoConfig;
import com.SaveLife.model.Donor;

public class Utility {
	
	public static MongoOperations getMongoOps() {
		ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringMongoConfig.class);
		MongoOperations mongoOperation = (MongoOperations) ctx.getBean("mongoTemplate");
		return mongoOperation;
	}
	
	public static List<Donor> getAllDonors() {
		MongoOperations mongoOps = Utility.getMongoOps();
		List<Donor> donors = mongoOps.findAll(Donor.class);
		if (donors != null) {
			return donors;
		}
		return null;
	}
	
	public static String CapitalizeIndex(String obj) {
		if (!StringUtils.isEmpty(obj)) {
			obj = obj.substring(0,1).toUpperCase() + obj.substring(1);
		}
		return obj;
	}
	
	public static List<Donor> getDonorsByTwoColumn(String columnOneName, String searchOneString, String columnTwoName, String searchTwoString, boolean flag) {
		Criteria criteriaOne = new Criteria().where(columnOneName).is(searchOneString);
		Criteria criteriaTwo = new Criteria().where(columnTwoName).is(searchTwoString);
		Criteria criteriaOr = new Criteria().andOperator(criteriaOne, criteriaTwo);
		Query query = Query.query(criteriaOr);
		return commonQuery(flag, query);
	}
	
	public static List<Donor> getDonorsByOneColumn(String columnName, String searchString, boolean flag) {
		Query query = new Query(new Criteria().where(columnName).is(searchString));
		return commonQuery(flag, query);
	}

	private static List<Donor> commonQuery(boolean flag, Query query) {
		MongoOperations mongoOps = Utility.getMongoOps();
		List<Donor> donors = null;
		Query query1 = new Query(new Criteria().where("_id").is("1"));
		if (flag && mongoOps.find(query, Donor.class) != null) {
			donors = mongoOps.find(query, Donor.class);
		} else if (mongoOps.findOne(query, Donor.class) != null) {
			Donor donor = mongoOps.findOne(query, Donor.class);
			donors = Arrays.asList(donor);
		}
		
		return donors;
	}
}
