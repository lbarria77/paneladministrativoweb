import 'package:flutter/material.dart';
import 'package:foodme_backend/models/category_model.dart';

class CategoryListTile extends StatelessWidget {
  final Category category;
  const CategoryListTile({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        category.imageUrl,
        height: 25.0,
      ),
      title: Text(
        category.name,
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        category.description,
        style: Theme.of(context).textTheme.headline6,
      ),
      trailing: const Icon(Icons.menu),
    );
  }
}