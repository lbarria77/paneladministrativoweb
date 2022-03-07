import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodme_backend/blocs/product/product_bloc.dart';
import 'package:foodme_backend/config/responsive.dart';

import 'package:foodme_backend/widgets/widgets.dart';

import '../../blocs/category/category_bloc.dart';
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
                      child: Center(
                        child: Text(
                          'Banners Aqui',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
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
                    child: const Center(
                        child: Text(
                      'Banners Aqui',
                    )),
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
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
              }
              if (state is CategoryLoaded) {
                return ReorderableListView(
                    shrinkWrap: true,
                    children: [
                      for (int index = 0;
                          index < state.categories.length;
                          index++)
                        CategoryListTile(
                          category: state.categories[index],
                          onTap: () {
                            // Click to select the category
                            context
                                .read<CategoryBloc>()
                                .add(SelectCategory(state.categories[index]));
                          },
                          key: ValueKey(state.categories[index].id),
                        ),
                    ],
                    onReorder: (oldIndex, newIndex) {
                      context.read<CategoryBloc>().add(SortCategories(
                          oldIndex: oldIndex, newIndex: newIndex));
                    });
              } else {
                return const Text('Ha ocurrido un error');
              }
            },
          ),
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
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
              }
              if (state is ProductLoaded) {
                return ReorderableListView(
                    shrinkWrap: true,
                    children: [
                      for (int index = 0;
                          index < state.products.length;
                          index++)
                        ProductListTile(
                          product: state.products[index],
                          onTap: () {
                            // Click to select the category
                          },
                          key: ValueKey(state.products[index].id),
                        ),
                    ],
                    onReorder: (oldIndex, newIndex) {
                      context.read<ProductBloc>().add(
                          SortProducts(oldIndex: oldIndex, newIndex: newIndex));
                    });
              } else {
                return const Text('Ha ocurrido un error');
              }
            },
          ),
          // ...Product.products.map(
          //   (product) {
          //     return ProductListTile(
          //       product: product,
          //     );
          //   },
          // ).toList()
        ],
      ),
    );
  }
}
