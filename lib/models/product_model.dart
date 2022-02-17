import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final double price;
  final int index;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.index,
  });

  Product copyWith({
    String? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    double? price,
    int? index,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      index: index ?? this.index,
    );
  }

  factory Product.fromSnapshot(Map<String, dynamic> snap) {
    return Product(
      id: snap['id'],
      name: snap['name'],
      category: snap['category'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      index: snap['index'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        description,
        imageUrl,
        price,
        index,
      ];

  static List<Product> products = const [
    Product(
      id: '1',
      name: 'Margherita',
      category: 'Pizzas',
      description: 'Tomate, mozzarella, Albahaca',
      price: 4.99,
      imageUrl: 'https://images.unsplash.com/photo-1589187151053-5ec8818e661b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fGhhbSUyMHBpenphfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      index: 0,
    ),
    Product(
      id: '2',
      name: '4 Formaggi',
      category: 'Pizzas',
      description: 'Tomatoes, mozzarella, 4 quesos',
      price: 4.99,
      imageUrl: 'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fGhhbSUyMHBpenphfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      index: 1,
    ),
    Product(
      id: '3',
      name: 'Pizza de Jamon',
      category: 'Pizzas',
      description: 'Jamon, mozzarella, pimenton',
      price: 4.99,
      imageUrl: 'https://images.unsplash.com/photo-1599321955726-e048426594af?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzh8fGhhbSUyMHBpenphfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      index: 2,
    ),
    Product(
      id: '4',
      name: 'Pizza de Peperoni',
      category: 'Pizzas',
      description: 'Peperoni, mozzarella',
      price: 4.99,
      imageUrl: 'https://images.unsplash.com/photo-1534308983496-4fabb1a015ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHBlcGVyb25pJTIwcGl6emF8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      index: 3,
    ),
    Product(
      id: '5',
      name: 'Te Frio',
      category: 'Bebidas',
      description: 'Botella',
      price: 1.99,
      imageUrl: 'https://images.unsplash.com/photo-1595252046564-55f55a02afad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aWNlJTIwdGVhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      index: 4,
    ),
    Product(
      id: '6',
      name: 'Pepsi',
      category: 'Bebidas',
      description: 'Lata',
      price: 1.99,
      imageUrl: 'https://images.unsplash.com/photo-1629203851288-7ececa5f05c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cGVwc2l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      index: 5,
    ),
    Product(
      id: '7',
      name: 'Coca Cola',
      category: 'Bebidas',
      description: 'Lata',
      price: 1.99,
      imageUrl: 'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      index: 6,
    ),
    Product(
      id: '8',
      name: 'Water',
      category: 'Bebidas',
      description: 'Embotellada',
      price: 1.99,
      imageUrl: 'https://images.unsplash.com/photo-1633949698015-0f8a8b261c07?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
      index: 7,
    ),
    Product(
      id: '9',
      name: 'Ensalada Caesar ',
      category: 'Ensaladas',
      description: 'Lechuga, Bacon, Pollo y Salsa',
      price: 1.99,
      imageUrl: 'https://images.unsplash.com/photo-1550304943-4f24f54ddde9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2Flc2FyJTIwc2FsYWR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      index: 8,
    ),
    Product(
      id: '10',
      name: 'Cheese Burguer',
      category: 'Hamburguesas',
      description: 'Doble carne, doble queso, bacon y papas',
      price: 9.99,
      imageUrl: 'https://images.unsplash.com/photo-1529565214304-a882ebc5a8e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y2hlZXNlJTIwYnVyZ3VlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      index: 9,
    ),
    Product(
      id: '11',
      name: 'Chocolate Cake',
      category: 'Postres',
      description: 'Triple chocolate',
      price: 9.99,
      imageUrl: 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2hvY29sYXRlJTIwY2FrZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60  ',
      index: 10,
    ),
  ];
}
