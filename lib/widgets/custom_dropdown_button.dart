import 'package:flutter/material.dart';
import 'package:foodme_backend/models/category_model.dart';

class CustomDropDownButton extends StatelessWidget {
  final List<String> items;
  final Function(String?)? onChanged;
  const CustomDropDownButton({
    Key? key,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 75.0,
          child: Text(
            'Categoria',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: SizedBox(
            height: 45.0,
            child: DropdownButtonFormField(
              iconSize: 20.0,
              onChanged: onChanged,
              items: items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
