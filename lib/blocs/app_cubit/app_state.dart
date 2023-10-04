part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}
class IsFavoriteChangedState extends AppState {}
class AddToTotalState extends AppState {}

