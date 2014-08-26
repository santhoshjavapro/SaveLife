package com.SaveLife.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.SaveLife.config.SpringMongoConfig;
import com.SaveLife.model.Donor;


@RestController
@RequestMapping("/Controller")
public class SaveLifeController {
	@RequestMapping( method= RequestMethod.GET, headers="Accept=application/json")
	public Donor getFirstApp() {
		/*try {
			MongoClient mongo = new MongoClient( "localhost" , 27017 );
			DB db = mongo.getDB("layer");
			DBCollection table = db.getCollection("newUsers");
			//Add
			BasicDBObject document = new BasicDBObject();
			document.put("name", "mkyong");
			document.put("age", 30);
			document.put("createdDate", new Date());
			table.insert(document);
			
			//Update
			BasicDBObject query = new BasicDBObject();
			query.put("name", "mkyong");
		 
			BasicDBObject newDocument = new BasicDBObject();
			newDocument.put("name", "mkyong-updated");
		 
			BasicDBObject updateObj = new BasicDBObject();
			updateObj.put("$set", newDocument);
		 
			table.update(query, updateObj);
			
			 //Query
			BasicDBObject searchQuery = new BasicDBObject();
			searchQuery.put("name", "mkyong-updated");
		 
			DBCursor cursor = table.find(searchQuery);
		 
			while (cursor.hasNext()) {
				System.out.println("hello===> "+cursor.next());
			}
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}*/
		
//		ApplicationContext ctx = new GenericXmlApplicationContext("savelife-servlet.xml");
//		MongoOperations mongoOperation = (MongoOperations) ctx.getBean("mongoTemplate");
		ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringMongoConfig.class);
		MongoOperations mongoOperation = (MongoOperations) ctx.getBean("mongoTemplate");
		Donor donor = new Donor("1", "Santhosh1", "O positive", "9962678306");
		mongoOperation.save(donor);
		return donor;
	}
}
