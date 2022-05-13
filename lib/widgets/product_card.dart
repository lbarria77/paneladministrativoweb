import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodme_backend/blocs/product/product_bloc.dart';
import 'package:foodme_backend/models/model.dart';
import 'package:foodme_backend/widgets/custom_dropdown_button.dart';
import 'package:foodme_backend/widgets/custom_text_form_field.dart';

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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Product product = const Product(
                          name: '',
                          category: '',
                          description: '',
                          imageUrl: '',
                          price: 0,
                        );
                        return Dialog(
                          child: Container(
                            color: Theme.of(context).backgroundColor,
                            height: 450.0,
                            width: 500.0,
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text(
                                  'Agregar Producto',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                const SizedBox(height: 20.0),
                                CustomDropDownButton(
                                  items: Category.categories
                                      .map((category) => category.name)
                                      .toList(),
                                  onChanged: (value) {
                                    product = product.copyWith(
                                      category: value,
                                    );
                                    print(product);
                                  },
                                ),
                                const SizedBox(height: 10.0),
                                CustomTextFormField(
                                  maxLines: 1,
                                  title: 'Nombre:',
                                  hasTitle: true,
                                  initialValue: '',
                                  onChanged: (value) {
                                    product = product.copyWith(
                                      name: value,
                                    );
                                  },
                                ),
                                CustomTextFormField(
                                  maxLines: 1,
                                  title: 'Precio:',
                                  hasTitle: true,
                                  initialValue: '',
                                  onChanged: (value) {
                                    product = product.copyWith(
                                      price: double.parse(value),
                                    );
                                  },
                                ),
                                CustomTextFormField(
                                  maxLines: 1,
                                  title: 'Imagen:',
                                  hasTitle: true,
                                  initialValue: '',
                                  onChanged: (value) {
                                    product = product.copyWith(
                                      imageUrl: value,
                                    );
                                  },
                                ),
                                CustomTextFormField(
                                  maxLines: 3,
                                  title: 'Descripcion:',
                                  hasTitle: true,
                                  initialValue: '',
                                  onChanged: (value) {
                                    product = product.copyWith(
                                      description: value,
                                    );
                                  },
                                ),
                                const SizedBox(height: 20.0),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    BlocProvider.of<ProductBloc>(context).add(
                                      AddProduct(product: product),
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Guardar',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                        
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.add_circle,
                    size: 40.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
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
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  '\$${product.price}',
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
    );
  }
}
