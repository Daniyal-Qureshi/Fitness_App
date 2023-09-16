import 'dart:developer' as developer;
import 'package:hive/hive.dart';

class Database {
  static var user_data; //user data
  //initialize the database
  static initialize() {
    //open the box
    final fitness = Hive.box("fitnessx");
    //check if the user data is present or not
    if (fitness.get("user") == null) {
      fitness.put("user",
          {"username": "daniel", "password": "1234", "pin": "12345678"});
      //put the user data
    }
    //check if the videos data is present or not
    if (fitness.get("videos") == null) {
      fitness.put("videos", []);
      //put the videos data
    }

    developer.log("data added ${fitness.get('user')}"); //log the data
    user_data = fitness.get('user'); //get the user data
  }
}
