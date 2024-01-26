// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, unused_import

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_aut/login.dart';

class H_dashboard extends StatefulWidget {
  const H_dashboard({Key? key}) : super(key: key);

  @override
  State<H_dashboard> createState() => _H_dashboardState();
}

class _H_dashboardState extends State<H_dashboard> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[200],
        centerTitle: true,
        title: const Text("Dashboard"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selamat Datang",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _auth.signOut();
                  Navigator.of(context).pushReplacementNamed('/login');
                } catch (e) {
                  print("Error signing out: $e");
                  // Handle the error, e.g., display a SnackBar
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Error signing out: $e"),
                  ));
                }
              },
              child: const Text("Sign Out"),
            )
          ],
        ),
      ),
    );
  }
}
