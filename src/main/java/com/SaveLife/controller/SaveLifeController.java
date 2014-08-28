package com.SaveLife.controller;

import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.SaveLife.Utility.Persistent;
import com.SaveLife.model.Credential;
import com.SaveLife.model.Donor;


@RestController
@RequestMapping("/SaveLife")
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
		
		MongoOperations mongoOps = Persistent.getMongoOps();
//		Donor donor = new Donor("2", "reddy", "O positive", "xxxxxxxxxx");
		Credential cred1 = new Credential("1", "santhosh", "santhosh");
		Credential cred2 = new Credential("2","rohan", "rohan");
		Credential cred3 = new Credential("3","syam", "syam");
		Credential cred4 = new Credential("4","reddy", "reddy");
//		mongoOps.save(donor);
		mongoOps.save(cred1);
		mongoOps.save(cred2);
		mongoOps.save(cred3);
		mongoOps.save(cred4);
//		mongoOps.remove(Credential.class);
		return new Donor();
	}
}
