import 'package:firestore_crud/providers/product_provider.dart';
import 'package:firestore_crud/screens/products.dart';
import 'package:firestore_crud/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ProductProvider()),
            StreamProvider(create: (context)=> firestoreService.getProducts()),
          ],
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Products(),
      ),
    );
  }
}

