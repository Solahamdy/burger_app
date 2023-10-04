import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context)=> BlocProvider.of(context);

  List<Map<String, dynamic>> gridData = [
    {
      'image': 'assets/cheese burger.jpg',
      'name': ' Cheese Burger ',
      'weight': '200 g',
      'price': 55.00,
      'oldPrice': '\$ 67.00',
      'isOffer': true,
      'offer': '25 % off',
      'isFavorite' : false
    },
    {
      'image': 'assets/chicken burger.jpg',
      'name': 'Chicken Burger ',
      'weight': '200 g',
      'price': 44.50,
      'oldPrice': '',
      'isOffer': false,
      'isFavorite' : false
    },
    {
      'image': 'assets/pizza.jpg',
      'name': ' Pizza ',
      'weight': 'small / medium ',
      'price': 51.00,
      'oldPrice': '',
      'isOffer': false,
      'isFavorite' : false
    },
    {
      'image': 'assets/fries.jpg',
      'name': 'Fries  ',
      'weight': 'packet of fries',
      'price': 17.00,
      'oldPrice': '\$ 24.00',
      'isOffer': true,
      'offer': '15 % off',
      'isFavorite' : false
    },
    {
      'image': 'assets/doritos.jpg',
      'name': ' Doritos ',
      'weight': 'packet of doritos',
      'price': 8.50,
      'oldPrice': '\$ 12.00',
      'isOffer': true,
      'offer': '5 % off',
      'isFavorite' : false
    },
    {
      'image': 'assets/hot dog.jpg',
      'name': 'Hot Dog ',
      'weight': '150 g',
      'price': 35.00,
      'oldPrice': '',
      'isOffer': false,
      'isFavorite' : false
    },
  ];
  double total = 0.0;

   addToTotal(double amount) {
      total += amount;
      emit(AddToTotalState());
  }

   isFavoriteChanged(index){
      gridData[index]['isFavorite'] = !gridData[index]['isFavorite'];
     emit(IsFavoriteChangedState());
   }

}
