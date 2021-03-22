import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Authentication/Email/LoginEmail.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("appBar Home"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bienvenido"),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green)
              ),
              onPressed: () async{
                await FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (BuildContext context) => LoginEmail())
                  );
                });
              },
              child: Text("CERRAR SESION"),
            )
          ],
        ),
      ),
    );
  }
}