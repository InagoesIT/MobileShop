import 'package:flutter/material.dart';
import 'package:mobile_shop/mobile_shop_app.dart';
import 'package:mobile_shop/repositories/category_repository_impl.dart';
import 'package:mobile_shop/repositories/product_repository_impl.dart';
import 'package:mobile_shop/view_models/category_view_model.dart';
import 'package:mobile_shop/view_models/products_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:
              (_) =>
                  CategoryViewModel(repository: CategoryRepositoryImpl())
                    ..fetchCategories(),
        ),
        ChangeNotifierProvider(
          create:
              (_) =>
                  ProductsViewModel(repository: ProductRepositoryImpl())
                    ..fetchBestSoldProducts(),
        ),
      ],
      child: const MobileShopApp(),
    ),
  );
}
