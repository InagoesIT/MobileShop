import 'package:flutter/material.dart';
import 'package:mobile_shop/views/products/products_page.dart';
import 'package:mobile_shop/views/styling/app_global_theme.dart';

class MobileShopApp extends StatelessWidget {
  const MobileShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Shop',
      theme: GlobalAppTheme.getThemeData(),
      home: const ProductsPage(),
    );
  }
}
