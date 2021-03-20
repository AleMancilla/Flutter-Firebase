import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  // Cree el futuro de inicialización fuera de `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Inicializar FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Compruebe si hay errores
        if (snapshot.hasError) {
          return CircularProgressIndicator();
        }
        // Una vez completado, muestre su solicitud
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Material App',
            home: Scaffold(
              body: Center(
                child: Container(
                  child: Text('Hello World'),
                ),
              ),
            ),
          );
        }
        // De lo contrario, muestre algo mientras espera a que se complete la inicialización
        return CircularProgressIndicator();
      },
    );
  }
}