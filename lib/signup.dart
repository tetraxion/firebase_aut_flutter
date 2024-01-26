// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aut/dashboard.dart';
import 'package:flutter_aut/login.dart';

class H_signup extends StatefulWidget {
  const H_signup({Key? key}) : super(key: key);

  @override
  State<H_signup> createState() => _H_signupState();
}

class _H_signupState extends State<H_signup> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController d_username = TextEditingController();
  TextEditingController d_email = TextEditingController();
  TextEditingController d_password = TextEditingController();

  String dataUsername = "";
  String dataEmail = "";
  String dataPassword = "";

  void f_SignUp() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: dataEmail, password: dataPassword);
      print("Registrasi berhasil : ${userCredential.user!.email}");
      Navigator.of(context).pushReplacementNamed('/dashboard');
    } catch (error) {
      print("Terjadi kesalahan : $error");
      // Handle the error, e.g., display a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Terjadi kesalahan: $error"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sign Up Screen"),
        backgroundColor: Colors.cyan[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Username",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 500,
              height: 50,
              color: Colors.cyan[100],
              child: TextField(
                controller: d_username,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan Username'),
                onChanged: (value) {
                  dataUsername = d_username.text;
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Email",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 500,
              height: 50,
              color: Colors.cyan[100],
              child: TextField(
                controller: d_email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Masukkan Email'),
                onChanged: (value) {
                  dataEmail = d_email.text;
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Password",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 500,
              height: 50,
              color: Colors.cyan[100],
              child: TextField(
                controller: d_password,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan Password'),
                onChanged: (value) {
                  dataPassword = d_password.text;
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: f_SignUp, child: Text("Sign Up")),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  child: Text("Login"),
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return H_Login();
                    }));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
