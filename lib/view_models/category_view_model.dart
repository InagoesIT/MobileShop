import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_shop/models/category.dart';
import 'package:mobile_shop/repositories/category_repository.dart';
import 'package:mobile_shop/views/utils/toast_shower.dart';

class CategoryViewModel extends ChangeNotifier {
  final CategoryRepository repository;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  CategoryViewModel({required this.repository});

  List<Category> _categories = [];

  List<Category> get categories => _categories;

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();

    try {
      _categories = await repository.getCategories();
    } catch (e) {
      String error;
      if (e is SocketException) {
        error = 'Please connect to a stable internet connection and try again';
      } else {
        error = 'Failed to load categories';
      }
      ToastShower.showError(error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


}
