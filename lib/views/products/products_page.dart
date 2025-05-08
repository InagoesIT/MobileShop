import 'package:flutter/material.dart';
import 'package:mobile_shop/models/category.dart';
import 'package:mobile_shop/models/product.dart';
import 'package:mobile_shop/views/categories/categories_list.dart';
import 'package:mobile_shop/views/components/bottom_nav_bar.dart';
import 'package:mobile_shop/views/components/custom_text_button.dart';
import 'package:mobile_shop/views/components/products_list.dart';
import 'package:mobile_shop/views/components/products_search_bar.dart';
import 'package:mobile_shop/views/components/section_title.dart';

import 'package:provider/provider.dart';
import 'package:mobile_shop/view_models/product_view_model.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          controller: viewModel.scrollController, // for pagination
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Padding(
                    padding: defaultPageEdgeInsets,
                    child: ProductsSearchBar(
                      onSearch: (value) => viewModel.searchProducts(value),
                    ),
                  ),
                  const SizedBox(height: 44),
                  Padding(
                    padding: defaultPageEdgeInsets,
                    child: SectionTitle(title: 'Categories'),
                  ),
                  const SizedBox(height: 18),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: CategoriesList(),
                  ),
                  const SizedBox(height: 44),
                  Padding(
                    padding: defaultPageEdgeInsets,
                    child: SectionTitle(
                      title: 'Best Selling',
                      trailing: CustomTextButton(text: 'See all'),
                    ),
                  ),
                  const SizedBox(height: 28),
                ],
              ),
            ),
            if (viewModel.isLoading)
              const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              )
            else if (viewModel.products.isEmpty)
              SliverToBoxAdapter(
                child: Center(child: Text('No products found')),
              )
            else
              SliverPadding(
                padding: defaultPageEdgeInsets,
                sliver: ProductsList(products: viewModel.products),
              ),
            if (viewModel.isLoadingMore)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 28)),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  EdgeInsets get defaultPageEdgeInsets =>
      const EdgeInsets.symmetric(horizontal: 16);
}
