import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Nombre del Restaurante',
        style: Theme.of(context)
            .textTheme
            .headline2!
            .copyWith(color: Colors.white),
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}