import 'package:flutter/material.dart';
import 'package:mobile_shop/models/category.dart';
import 'package:mobile_shop/view_models/products_view_model.dart';
import 'package:provider/provider.dart';
import 'package:mobile_shop/view_models/category_view_model.dart';
import 'package:mobile_shop/views/components/category_card.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryViewModel = context.watch<CategoryViewModel>();
    final productsViewModel = context.read<ProductsViewModel>();

    context.select<ProductsViewModel, Category?>(
      (viewModel) => viewModel.selectedCategory,
    );

    return SizedBox(
      height: 110,
      child: _buildContent(categoryViewModel, productsViewModel),
    );
  }

  Widget _buildContent(
    CategoryViewModel categoryViewModel,
    ProductsViewModel productsViewModel,
  ) {
    if (categoryViewModel.isLoading) {
      return buildLoadingIndicator();
    } else if (categoryViewModel.categories.isEmpty) {
      return buildNoCategoriesMessage();
    } else {
      return buildList(categoryViewModel.categories, productsViewModel);
    }
  }

  Widget buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildNoCategoriesMessage() {
    return const Center(child: Text('No categories found.'));
  }

  ListView buildList(
    List<Category> categories,
    ProductsViewModel productsViewModel,
  ) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => const SizedBox(width: 18),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];

        return CategoryCard(
          category: category,
          isSelected: productsViewModel.isCategorySelected(category),
          onTap: productsViewModel.selectCategory,
        );
      },
    );
  }
}
