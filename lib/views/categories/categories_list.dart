import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_shop/view_models/category_view_model.dart';
import 'package:mobile_shop/views/components/category_card.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CategoryViewModel>();

    return SizedBox(
      height: 110,
      child: FutureBuilder(
        future: viewModel.fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final categories = viewModel.categories;
          if (categories.isEmpty) {
            return const Center(child: Text('No categories found.'));
          }

          return ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 18),
            itemCount: categories.length,
            itemBuilder:
                (context, index) => CategoryCard(category: categories[index]),
          );
        },
      ),
    );
  }
}
