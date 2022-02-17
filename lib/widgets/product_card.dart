import 'package:flutter/material.dart';
import 'package:foodme_backend/models/model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;

  const ProductCard({Key? key, required this.product, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 10.0,
      ),
      width: 150.0,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: (index == 0)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_circle,
                    size: 40.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 20.0,),
                Text(
                  'Agregar Producto',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(product.imageUrl),
                ),
                const SizedBox(height: 20.0,),
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 5.0,),
                Text(
                  '\$${product.name}',
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
    );
  }
}
