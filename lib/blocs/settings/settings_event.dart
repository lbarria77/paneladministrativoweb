part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class LoadSettings extends SettingsEvent{
  final Restaurant restaurant;

  const LoadSettings({required this.restaurant});
  @override
  List<Object> get props => [restaurant];
}
class UpdateSettings extends SettingsEvent{
  final Restaurant restaurant;

  const UpdateSettings({required this.restaurant});
  @override
  List<Object> get props => [restaurant];
}
class UpdateOpenigHours extends SettingsEvent{
  final OpeningHours openingHours;

  const UpdateOpenigHours({required this.openingHours});
  @override
  List<Object> get props => [openingHours];
  
}
