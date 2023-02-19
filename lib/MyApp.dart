// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled73/shared/Bloc/Cubit/Bloc_Cubit.dart';

import 'modules/splash/splash.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => MyBloc(),) ,
        BlocProvider(create: (context) => cubitBottom(),) ,
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false ,
        home: splashScreen(),

      ),
    );
  }
}