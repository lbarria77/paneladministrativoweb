import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int index;

  const Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.index,
  });

  Category copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    int? index,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.description,
      description: description ?? this.imageUrl,
      index: index ?? this.index,
    );
  }

  factory Category.fromSnapshot(Map<String, dynamic> snap) {
    return Category(
      id: snap['id'],
      name: snap['name'],
      imageUrl: snap['imageUrl'],
      description: snap['description'],
      index: snap['index'],
    );
  }

  @override
  List<Object?> get props => [id, name, imageUrl, description, index];

  static List<Category> categories = [
    const Category(
      id: '1',
      name: 'Pizzas',
      description: 'Aui va la descripcion de los productos',
      imageUrl: 'assets/pizza.png',
      index: 0,
    ),
    const Category(
      id: '2',
      name: 'Hamburguesas',
      description: 'Aui va la descripcion de los productos',
      imageUrl: 'assets/burger.png',
      index: 1,
    ),
    const Category(
      id: '3',
      name: 'Postres',
      description: 'Aui va la descripcion de los productos',
      imageUrl: 'assets/pancake.png',
      index: 2,
    ),
    const Category(
      id: '4',
      name: 'Ensaladas',
      description: 'Aui va la descripcion de los productos',
      imageUrl: 'assets/avocado.png',
      index: 3,
    ),
    const Category(
      id: '5',
      name: 'Bebidas',
      description: 'Aui va la descripcion de los productos',
      imageUrl: 'assets/juice.png',
      index: 4,
    ),
  ];
}
