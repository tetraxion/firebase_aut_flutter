// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aut/dashboard.dart';
import 'package:flutter_aut/signup.dart';

class H_Login extends StatefulWidget {
  const H_Login({Key? key}) : super(key: key);

  @override
  _H_LoginState createState() => _H_LoginState();
}

class _H_LoginState extends State<H_Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String dataEmail = "";
  String dataPassword = "";

  void f_login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: dataEmail,
        password: dataPassword,
      );
      print("Login berhasil : ${userCredential.user!.email}");
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return H_dashboard();
      }));
    } catch (error) {
      print("Terjadi kesalahan : $error");
      // Tampilkan pesan error kepada pengguna, misalnya menggunakan SnackBar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Terjadi kesalahan: $error"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: const Text("Halaman Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Email",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 500,
              height: 50,
              color: Colors.cyan[100],
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan Email',
                ),
                onChanged: (value) {
                  setState(() {
                    dataEmail = value;
                  });
                },
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Password",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 500,
              height: 50,
              color: Colors.cyan[100],
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan Password',
                ),
                onChanged: (value) {
                  setState(() {
                    dataPassword = value;
                  });
                },
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: f_login, child: Text("Login")),
                SizedBox(width: 15),
                GestureDetector(
                  child: Text("Sign Up"),
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return H_signup();
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
