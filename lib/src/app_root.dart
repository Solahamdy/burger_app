import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixth_app/screens/home_screen.dart';
import 'package:sixth_app/screens/login_screen.dart';

import '../blocs/app_cubit/app_cubit.dart';

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>AppCubit())
      ],
      child: MaterialApp(home: Login(),),
    );
  }

}