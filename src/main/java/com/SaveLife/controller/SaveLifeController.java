package com.SaveLife.controller;

import java.net.UnknownHostException;
import java.util.Date;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.SaveLife.model.Donor;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

@RestController
@RequestMapping("/Controller")
public class SaveLifeController {
	@RequestMapping( method= RequestMethod.GET, headers="Accept=application/json")
	public Donor getFirstApp() {
		try {
			MongoClient mongo = new MongoClient( "localhost" , 27017 );
			DB db = mongo.getDB("layer");
			DBCollection table = db.getCollection("newUsers");
			//Add
			/*BasicDBObject document = new BasicDBObject();
			document.put("name", "mkyong");
			document.put("age", 30);
			document.put("createdDate", new Date());
			table.insert(document);*/
			
			//Update
			/*BasicDBObject query = new BasicDBObject();
			query.put("name", "mkyong");
		 
			BasicDBObject newDocument = new BasicDBObject();
			newDocument.put("name", "mkyong-updated");
		 
			BasicDBObject updateObj = new BasicDBObject();
			updateObj.put("$set", newDocument);
		 
			table.update(query, updateObj);*/
			
			 //Query
			BasicDBObject searchQuery = new BasicDBObject();
			searchQuery.put("name", "mkyong-updated");
		 
			DBCursor cursor = table.find(searchQuery);
		 
			while (cursor.hasNext()) {
				System.out.println("hello===> "+cursor.next());
			}
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		return new Donor("1", "Santhosh", "O positive", "9962678306");
	}
}
