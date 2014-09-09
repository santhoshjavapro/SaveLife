package com.SaveLife.Utility;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
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
}
