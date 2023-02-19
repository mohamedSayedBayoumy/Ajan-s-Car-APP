import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/Bloc/Cubit/Bloc_Cubit.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<cubitBottom>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *.2),
      width: MediaQuery.of(context).size.width * .04,
      height: MediaQuery.of(context).size.height * .05,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .02),
      child: ElevatedButton(
        onPressed: () {
          bloc.ButtonRegister(context);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text('Sing Up '),

          ],
        ),
      ),
    );
  }
}
