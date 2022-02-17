import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> screens = {
      'Dashboard': {
        'routeName': '/dash',
        'icon': const Icon(Icons.dashboard),
      },
      'Menu': {
        'routeName': '/menu',
        'icon': const Icon(Icons.menu_book),
      },
      'Horarios': {
        'routeName': '/dash',
        'icon': const Icon(Icons.lock_clock),
      },
      'Cerrar Sesion': {
        'routeName': '/dash',
        'icon': const Icon(Icons.logout_outlined),
      },
    };

    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 65.0,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Text(
                'Nombre Restaurante',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          ...screens.entries.map(
            (screens) {
              return ListTile(
                leading: screens.value['icon'],
                title: Text(screens.key),
                onTap: () => Navigator.pushNamed(
                  context,
                  screens.value['routeName'],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}