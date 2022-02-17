import 'package:flutter/material.dart';
import 'package:foodme_backend/config/responsive.dart';

import 'package:foodme_backend/widgets/widgets.dart';

import '../../models/model.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Menu del Restaurante',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: double.infinity,
                      height: 200.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Product.products.length,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            product: Product.products[index],
                            index: index,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Responsive.isWideDesktop(context) ||
                            Responsive.isDesktop(context)
                        ? Container(
                            constraints: const BoxConstraints(
                              minHeight: 300.0,
                              maxHeight: 1000.0,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: _buildCategories(context),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  child: _buildProducts(context),
                                ),
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              _buildCategories(context),
                              const SizedBox(height: 20.0),
                              _buildProducts(context),
                            ],
                          ),
                    const SizedBox(height: 20.0),
                    Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        minHeight: 75.0,
                      ),
                      color: Theme.of(context).primaryColor,
                      child: const Text(
                        'Banners Aqui',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Responsive.isWideDesktop(context) || Responsive.isDesktop(context)
              ? Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                      right: 20.0,
                    ),
                    color: Theme.of(context).backgroundColor,
                    child: const Center(child: Text('Banners Aqui')),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Container _buildCategories(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Theme.of(context).backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categorias',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 20.0),
          ...Category.categories.map(
            (category) {
              return CategoryListTile(category: category);
            },
          ).toList()
        ],
      ),
    );
  }

  Container _buildProducts(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Theme.of(context).backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Productos',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 20.0),
          ...Product.products.map(
            (product) {
              return ProductListTile(
                product: product,
              );
            },
          ).toList()
        ],
      ),
    );
  }
}
