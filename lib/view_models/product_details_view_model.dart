import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_shop/models/detailed_product.dart';
import 'package:mobile_shop/repositories/product_repository.dart';
import 'package:mobile_shop/views/components/toast_shower.dart';

class ProductDetailsViewModel extends ChangeNotifier {
  final int productId;
  final ProductRepository repository;
  DetailedProduct? product;
  bool isLoading = false;

  ProductDetailsViewModel({required this.productId, required this.repository});

  Future<void> fetchProductById() async {
    isLoading = true;
    notifyListeners();
    try {
      product = await repository.getProductById(productId);
    } catch (error) {
      _handleError(error);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void _handleError(Object error) {
    print(error);
    String message;
    if (error is SocketException) {
      message = 'Please connect to a stable internet connection and try again';
    } else {
      message = 'Failed to load product details';
    }
    ToastShower.showError(message);
  }
}
