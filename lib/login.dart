import 'package:fitness_geek/Pin.dart';
import 'package:fitness_geek/database.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Loginstate();
}

class Loginstate extends State<Login> {
  @override
  void initState() {
    super.initState();
    Database.initialize();
  }

  final TextEditingController _username =
      TextEditingController(); //edit username
  final TextEditingController _password =
      TextEditingController(); // edit password
  bool isvisible = false; //error message visibility
  String errormessage = ""; //error message

  void checkCredentials() async {
    if (_username.text.isEmpty || _password.text.isEmpty) {
      setState(() {
        isvisible = true;
        errormessage = "Please enter credentials";
      });
    } else if (_username.text == Database.user_data['username'] &&
        _password.text == Database.user_data['password']) {
      Navigator.of(context).popUntil((route) => route.isFirst);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (BuildContext context) => Pin()));
    } else {
      setState(() {
        isvisible = true;
        errormessage = "Invalid Credentials";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Raleway'), //font family
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black,
        ),
        //body
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Sign in to continue",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //error message
                      Visibility(
                          visible: isvisible,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, right: 6),
                            child: Container(
                                width: double.infinity,
                                height: 50,
                                color: Color(int.parse("0xff${"f4c2c2"}")),
                                child: Align(
                                  child: Text(errormessage,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red)),
                                )),
                          )),
                      //username field
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: TextField(
                          controller: _username,
                          onChanged: (text) {
                            setState(() {
                              isvisible = false;
                            });
                          },
                          maxLines: null,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.none,
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 0.0),
                              ),
                              focusedBorder:  OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 0.0),
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(),
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                              labelText: "Username"),
                        ),
                      ),
                      //password field
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: TextField(
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          controller: _password,
                          onChanged: (text) {
                            setState(() {
                              isvisible = false;
                            });
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 0.0),
                              ),
                              border: OutlineInputBorder(),
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                              labelText: "Password"),
                        ),
                      ),
                      //login button
                      Row(children: [
                        const Padding(
                            padding: EdgeInsets.only(left: 6, top: 10),
                            child: Text("Log in",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black,
                                ))),
                        Padding(
                            padding: const EdgeInsets.only(top: 6, left: 200),
                            child: IconButton(
                                icon:
                                    Image.asset('assets/images/rightarrow.png'),
                                iconSize: 50,
                                onPressed: () {
                                  checkCredentials();
                                }))
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
