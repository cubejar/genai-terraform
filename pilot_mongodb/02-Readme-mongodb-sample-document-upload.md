**********************************************************
Connect to MongoDB using mongosh with provided credentials
**********************************************************
      Example: If you had the mongodb admin username: admin, password: admin 123 then please use the below syntax.
      
      mongosh --username admin --password admin123 --authenticationDatabase admin --authenticationMechanism SCRAM-SHA-256


*****************************
Switch to the target database
*****************************
test> use orca_db;

    Insert a document into the "orca" collection using MongoDB Shell Syntax
    test> 
        db.getCollection('orca').insertMany([
            # User Info document
            {
                "_id": ObjectId("507f191e810c19729de860ea"),
                "username": "johndoe",
                "email": "johndoe@example.com",
                "passwordHash": "hash",
                "salt": "salt",
                "profile": {
                    "firstName": "John",
                    "lastName": "Doe",
                    "birthDate": ISODate("1990-01-01T00:00:00Z"),
                    "address": {
                        "street": "123 Main St",
                        "city": "Anytown",
                        "state": "Anystate",
                        "zip": "12345"
                    },
                    "phone": "123-456-7890"
                },
                "organizationId": ObjectId("507f191e810c19729de86100"),
                "teamIds": [
                    ObjectId("507f191e810c19729de86101"),
                    ObjectId("507f191e810c19729de86102")
                ],
                "createdAt": ISODate("2023-01-01T00:00:00Z"),
                "updatedAt": ISODate("2023-01-02T00:00:00Z"),
                "lastLogin": ISODate("2023-01-03T00:00:00Z"),
                "isActive": true,
                "settings": {
                    "newsletterSubscribed": true,
                    "notificationPreferences": {
                        "email": true,
                        "sms": false
                    }
                }
            }
        ]);

      test> db.getCollection('orca').find().pretty();

            Note: If you encounter an "Uncaught:SyntaxError: Missing semicolon" then 
            please use JavaScript Object Notation (JSON) Syntax:
            
            db.getCollection('orca').insertMany([
            {
              "_id": "107f191e810c19729de860ea",
              "username": "johndoe",
              "email": "johndoe@example.com",
              "passwordHash": "hash",
              "salt": "salt",
              "profile": {
                  "firstName": "Ben",
                  "lastName": "Wells",
                  "birthDate": "1990-01-01T00:00:00Z",
                  "address": {
                      "street": "123 Main St",
                      "city": "Anytown",
                      "state": "Anystate",
                      "zip": "12345"
                  },
                  "phone": "123-456-7890"
              },
              "organizationId": "107f191e810c19729de86100",
              "teamIds": [
                  "107f191e810c19729de86101",
                  "107f191e810c19729de86102"
              ],
              "createdAt": "2023-01-01T00:00:00Z",
              "updatedAt": "2023-01-02T00:00:00Z",
              "lastLogin": "2023-01-03T00:00:00Z",
              "isActive": true,
              "settings": {
                  "newsletterSubscribed": true,
                  "notificationPreferences": {
                      "email": true,
                      "sms": false
                  }
              }
            }
            ]);

            test> db.getCollection('orca').find().pretty();

      // Even though it represents the same MongoDB document, but they use different syntax for representing certain types within MongoDB. 
      // Here are the key differences:
      // ObjectId vs String for _id, organizationId, and teamIds:
      // In the first version, you used the ObjectId function to create unique identifiers for _id, organizationId, and teamIds.
      // In the second version, you used strings directly for these identifiers.
       
      // ISODate vs new Date() for date values:
      // In the first version, you used ISODate to represent date values for birthDate, createdAt, updatedAt, and lastLogin.
      // In the second version, you used new Date() to represent date values.
       
      // Both versions are valid, and the choice between them depends on the context in which you are working:
      // If you are directly interacting with MongoDB using the MongoDB shell, using ObjectId and ISODate is idiomatic and recognized by the shell.
      
      // If you are working with these documents in a JavaScript context outside of the MongoDB shell 
      // (e.g., in a Node.js script), using strings for ObjectId and new Date() is a more standard JavaScript syntax.
      // Here's a side-by-side comparison:
      // Using ObjectId and ISODate (MongoDB Shell):
      // javascript format

      db.getCollection('orca').insertMany([ { "_id": ObjectId("507f191e810c19729de860ea"), "organizationId": ObjectId("507f191e810c19729de86100"), "teamIds": [ ObjectId("507f191e810c19729de86101"), ObjectId("507f191e810c19729de86102") ], // ... (other fields) "createdAt": ISODate("2023-01-01T00:00:00Z"), "updatedAt": ISODate("2023-01-02T00:00:00Z"), "lastLogin": ISODate("2023-01-03T00:00:00Z"), } ]); 

      // Using strings and new Date() (JavaScript outside MongoDB Shell):
      // javascript

      db.getCollection('orca').insertMany([ { "_id": "507f191e810c19729de860ea", "organizationId": "507f191e810c19729de86100", "teamIds": [ "507f191e810c19729de86101", "507f191e810c19729de86102" ], // ... (other fields) "createdAt": new Date("2023-01-01T00:00:00Z"), "updatedAt": new Date("2023-01-02T00:00:00Z"), "lastLogin": new Date("2023-01-03T00:00:00Z"), } ]); 

      // Choose the version that aligns with the context of your usage. If you're working within the MongoDB shell, the first version is more appropriate. 
      // If you're working in a JavaScript context outside of the MongoDB shell, the second version is more common.
