import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/Bloc/Cubit/Bloc_Cubit.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<cubitBottom>(context);
    final media = MediaQuery.of(context).size ;
    return Container(
      width: 50 ,
      padding: EdgeInsets.symmetric(horizontal: media.width*.35),
      child: bloc.loading
          ? null
          : ElevatedButton(
              onPressed: () {
                bloc.Buttonlogin(context) ;
              },
              style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
              ),
              child: const Text('Login'),
            ),
    );
  }
}
