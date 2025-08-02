import 'package:ecommerce_app/core/dependency_injuction/injection_container.dart';
import 'package:ecommerce_app/presentation/pages/product_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  setupServiceLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProductListPage());
  }
}
