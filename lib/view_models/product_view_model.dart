import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_shop/models/product.dart';
import 'package:mobile_shop/repositories/product_repository.dart';
import 'package:mobile_shop/repositories/product_response.dart';
import 'package:mobile_shop/views/components/toast_shower.dart';

class ProductViewModel extends ChangeNotifier {
  final int pageSize = 10;
  final ScrollController scrollController = ScrollController();
  final ProductRepository repository;
  List<Product> _products = List.empty(growable: true);
  bool _isLoading = false;
  bool _isLoadingMore = false;
  int _currentPage = 1;
  int _totalPages = 0;
  String _searchedText = '';

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  int get currentPage => _currentPage;

  ProductViewModel({required this.repository}) {
    scrollController.addListener(_onScroll);
  }

  Future<void> fetchBestSoldProducts() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      final ProductResponse response = await repository.getBestSoldProducts(
        page: currentPage,
        pageSize: pageSize,
        searchedText: _searchedText
      );
      _totalPages = response.totalPages;
      _products = response.products;
    } catch (error) {
      _handleError(error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void searchProducts(String query) async {
    _searchedText = query;
    _currentPage = 1;
    _totalPages = 0;
    await fetchBestSoldProducts();
  }

  void _handleError(Object error) {
    String message;
    if (error is SocketException) {
      message = 'Please connect to a stable internet connection and try again';
    } else {
      message = 'Failed to load products';
    }
    ToastShower.showError(message);
  }

  Future<void> loadMoreProducts() async {
    if (isLoadingMore) return;

    if (_currentPage == _totalPages) return;

    _isLoadingMore = true;
    _currentPage++;
    notifyListeners();

    try {
      final ProductResponse response = await repository.getBestSoldProducts(
        page: _currentPage,
        pageSize: pageSize,
      );
      _totalPages = response.totalPages;
      products.addAll(response.products);
    } catch (error) {
      _handleError(error);
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      loadMoreProducts();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
