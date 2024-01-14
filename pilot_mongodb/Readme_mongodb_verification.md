// Change the Mongo credentials below. Example:
// username: admin
// Mongo password: admin123

root@9fcf340f4134:/#   mongosh --username admin --password admin123 --authenticationDatabase admin --authenticationMechanism SCRAM-SHA-256

test>   use orca_db;

Insert a document into MongoDB

test>   db.getCollection('orca').insertMany([
          // User Info document
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

// Verification
test>   db.getCollection('orca').find().pretty();
