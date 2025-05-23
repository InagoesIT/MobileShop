import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_shop/models/category.dart';
import 'package:mobile_shop/models/product.dart';
import 'package:mobile_shop/repositories/product_repository.dart';
import 'package:mobile_shop/repositories/product_repository_impl.dart';
import 'package:mobile_shop/repositories/product_response.dart';
import 'package:mobile_shop/view_models/product_details_view_model.dart';
import 'package:mobile_shop/views/utils/toast_shower.dart';
import 'package:mobile_shop/views/product_details/product_details_page.dart';
import 'package:provider/provider.dart';

class ProductsViewModel extends ChangeNotifier {
  final int pageSize = 10;
  final ScrollController scrollController = ScrollController();
  final ProductRepository repository;
  List<Product> _products = List.empty(growable: true);
  bool _isLoading = false;
  bool _isLoadingMore = false;
  int _currentPage = 1;
  int _totalPages = 1;
  String _searchedText = '';
  Category? _selectedCategory;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  int get currentPage => _currentPage;
  Category? get selectedCategory => _selectedCategory;

  ProductsViewModel({required this.repository}) {
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchBestSoldProducts({setIsLoadingMore = false}) async {
    if (setIsLoadingMore){
      _isLoadingMore = true;
    }
    else{
     _isLoading = true;
    }
    notifyListeners();

    try {
      final filteredProducts = await _fetchProducts();
      _products.addAll(filteredProducts);
    } catch (error) {
      _handleError(error);
    } finally {
      if (setIsLoadingMore) {
        _isLoadingMore = false;
      } else {
        _isLoading = false;
      }
      notifyListeners();
    }
  }

  Future<List<Product>> _fetchProducts() async {
    List<Product> allProducts = [];
    while (allProducts.length < pageSize && currentPage <= _totalPages) {
      final ProductResponse response = await repository.getBestSoldProducts(
        page: currentPage,
        pageSize: pageSize,
        searchedText: _searchedText,
      );

      List<Product> filteredProducts = _filterByCategory(response.products);
      allProducts.addAll(filteredProducts);
      _currentPage++;
      _totalPages = response.totalPages;
    }
    
    return allProducts;
  }

  List<Product> _filterByCategory(List<Product> products) {
    if (selectedCategory == null) {
      return products;
    }
    return products
        .where((product) => product.categoryName == _selectedCategory?.name)
        .toList();
  }

  void searchProducts(String query) async {
    _searchedText = query;
    _resetPagination();
    await fetchBestSoldProducts();
  }

  bool isCategorySelected(Category category) {
    return _selectedCategory?.name == category.name;
  }

  void selectCategory(Category category) {
    _resetPagination();
    if (_selectedCategory?.name == category.name) {
      _selectedCategory = null;
    } else {
      _selectedCategory = category;
    }
    notifyListeners();
    fetchBestSoldProducts();
  }

  void goToProduct(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => ChangeNotifierProvider(
              create: (_) => _initProductDetailsViewModel(product.id),
              child: ProductDetailsPage(),
            ),
      ),
    );
  }

  ProductDetailsViewModel _initProductDetailsViewModel(int productId) {
    return ProductDetailsViewModel(
      productId: productId,
      repository: ProductRepositoryImpl(),
    )..fetchProductById();
  }

  void _resetPagination() {
    _currentPage = 1;
    _totalPages = 1;
    _products = [];
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

  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      fetchBestSoldProducts(setIsLoadingMore: true);
    }
  }
}
