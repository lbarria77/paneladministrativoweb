import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:foodme_backend/blocs/category/category_bloc.dart';
import 'package:foodme_backend/blocs/product/product_bloc.dart';
import 'package:foodme_backend/config/theme.dart';
import 'package:foodme_backend/models/category_model.dart';
import 'package:foodme_backend/models/model.dart';

import 'screens/menu/menu_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoryBloc()
              ..add(LoadCategories(categories: Category.categories)),
          ),
          BlocProvider(
            create: (context) => ProductBloc(
                categoryBloc: BlocProvider.of<CategoryBloc>(context))
              ..add(LoadProducts(products: Product.products)),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Foodme Backend',
          theme: theme(),
          initialRoute: '/menu',
          routes: {
            '/menu': (context) => const MenuScreen(),
            // '/dash': (context) => const DashboardScreen(),
            // '/opening-hours': (context) => const OpeningHoursScreen(),
          },
        ));
  }
}
