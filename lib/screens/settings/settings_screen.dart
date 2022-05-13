import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodme_backend/blocs/settings/settings_bloc.dart';
import 'package:foodme_backend/config/responsive.dart';

import 'package:foodme_backend/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: CustomLayout(
        title: 'Configuraciones',
        widgets: [
          _buildImage(),
          Responsive.isDesktop(context) || Responsive.isWideDesktop(context)
              ? IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildBasicInformation(context),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildRestaurantDescription(context),
                      ),
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBasicInformation(context),
                    const SizedBox(height: 10),
                    _buildRestaurantDescription(context),
                  ],
                ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Horarios de Apertura',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          _buildOpenigHours()
        ],
      ),
    );
  }

  BlocBuilder<SettingsBloc, SettingsState> _buildOpenigHours() {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SettingsLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.restaurant.openingHours!.length,
            itemBuilder: (context, index) {
              var openingHours = state.restaurant.openingHours![index];
              return OpenigHoursSettings(
                openingHours: openingHours,
                onSliderChanged: (value) {
                  context.read<SettingsBloc>().add(
                        UpdateOpenigHours(
                          openingHours: openingHours.copyWith(
                            openAt: value.start,
                            closeAt: value.end,
                          ),
                        ),
                      );
                },
                onCheckBoxChanged: (value) {
                  context.read<SettingsBloc>().add(
                        UpdateOpenigHours(
                          openingHours: openingHours.copyWith(
                            isOpen: !openingHours.isOpen,
                          ),
                        ),
                      );
                },
              );
            },
          );
        } else {
          return const Text('Ha ocurrido un error');
        }
      },
    );
  }

  Container _buildBasicInformation(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Theme.of(context).backgroundColor,
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SettingsLoaded) {
            return Column(
              children: [
                Text(
                  'Informacion Basica',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  maxLines: 1,
                  title: 'Nombre:',
                  hasTitle: true,
                  initialValue: (state.restaurant.name != null)
                      ? state.restaurant.name!
                      : '',
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            restaurant: state.restaurant.copyWith(name: value),
                          ),
                        );
                  },
                ),
                CustomTextFormField(
                  maxLines: 1,
                  title: 'Imagen:',
                  hasTitle: true,
                  initialValue: (state.restaurant.imageUrl != null)
                      ? state.restaurant.imageUrl!
                      : '',
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            restaurant:
                                state.restaurant.copyWith(imageUrl: value),
                          ),
                        );
                  },
                ),
                CustomTextFormField(
                  maxLines: 1,
                  title: 'Etiquetas:',
                  hasTitle: true,
                  initialValue: (state.restaurant.tags != null)
                      ? state.restaurant.tags!.join(', ')
                      : '',
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            restaurant: state.restaurant.copyWith(
                              tags: value.split(', '),
                            ),
                          ),
                        );
                  },
                ),
              ],
            );
          } else {
            return const Text('Ha ocurrido un error');
          }
        },
      ),
    );
  }

  Container _buildRestaurantDescription(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Theme.of(context).backgroundColor,
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SettingsLoaded) {
            return Column(
              children: [
                Text(
                  'Descripcion del Restaurante',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  maxLines: 5,
                  title: 'Descripcion:',
                  hasTitle: false,
                  initialValue: (state.restaurant.description != null)
                      ? state.restaurant.description!
                      : '',
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            restaurant:
                                state.restaurant.copyWith(description: value),
                          ),
                        );
                  },
                ),
              ],
            );
          } else {
            return const Text('Ha ocurrido un error');
          }
        },
      ),
    );
  }

  BlocBuilder<SettingsBloc, SettingsState> _buildImage() {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: ((context, state) {
        if (state is SettingsLoading) {
          return const SizedBox();
        }
        if (state is SettingsLoaded) {
          return (state.restaurant.imageUrl != null)
              ? Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          state.restaurant.imageUrl!,
                        ),
                        fit: BoxFit.cover),
                  ),
                )
              : const SizedBox();
        } else {
          return const Text('Ha ocurrido un error');
        }
      }),
    );
  }
}
