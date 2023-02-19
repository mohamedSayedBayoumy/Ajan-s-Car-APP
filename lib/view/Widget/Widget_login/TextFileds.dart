import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../modules/login_Regiester/regesiter_screen.dart';
import '../../../shared/Bloc/Cubit/Bloc_Cubit.dart';
import '../../../shared/Bloc/Cubit/States.dart';
import 'Login_Button.dart';
import 'Login_Container.dart';

class CustomTextfields extends StatelessWidget {
  const CustomTextfields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<cubitBottom>(context);

    return CustomContainer(
      widget: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          Form(
            key: bloc.fromKey,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(primary: Colors.black)),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              bloc.email;
                              return 'This field required';
                            }
                            return null;
                          },
                          controller: bloc.email,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_rounded,
                                color: bloc.colorPrefixIcon),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontFamily: 'myfont', color: Colors.black38),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                gapPadding: 8.0),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<cubitBottom, bottomNavgator>(
                          builder: (context, state) {
                            return TextFormField(
                              focusNode: bloc.foucesPassword,
                              controller: bloc.password,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  bloc.password;
                                  return 'Put Your Password ';
                                }
                                if (bloc.password.text.length < 6) {
                                  bloc.password;
                                  return 'you should but a least 6 letter';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              obscureText: bloc.obscureText,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    color: bloc.colorSuffixIcon,
                                    onPressed: () {
                                      bloc.iconpassword();
                                    },
                                    icon: Icon(bloc.icon)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    fontFamily: 'myfont', color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Do you have account ? ',
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold)),
                      TextButton(
                          onPressed: () async {
                            Navigator.push(
                                context,
                                PageTransition(
                                  child: const RegiesterScrrenForCustomer(),
                                  type: PageTransitionType.bottomToTop,
                                  duration: Duration(milliseconds: 500),
                                ));
                          },
                          child: Text(
                            'Register Now',
                            style: TextStyle(
                                fontFamily: 'poppins',
                                color: Colors.indigo.shade500),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
