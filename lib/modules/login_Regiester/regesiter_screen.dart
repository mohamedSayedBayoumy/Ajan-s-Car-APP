import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled73/view/Widget/Widget_login/Login_Container.dart';

import '../../shared/Bloc/Cubit/Bloc_Cubit.dart';
import '../../view/Widget/Widget_Register/Image_Container.dart';
import '../../view/Widget/Widget_Register/Resgister_Button.dart';

class RegiesterScrrenForCustomer extends StatefulWidget {
  const RegiesterScrrenForCustomer({Key? key}) : super(key: key);

  @override
  State<RegiesterScrrenForCustomer> createState() =>
      _RegiesterScrrenForCustomerState();
}

class _RegiesterScrrenForCustomerState
    extends State<RegiesterScrrenForCustomer> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<cubitBottom>(context);
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: ListView(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
            const ContaionerImage() ,
            CustomContainer(
              widget: Form(
                key: bloc.RegisterKey,
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * .02),
                  child:
                      Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme:
                                const ColorScheme.light(primary: Colors.black)),
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
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    fontFamily: 'myfont',
                                    color: Colors.grey.shade500),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    gapPadding: 8.0),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            TextFormField(
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
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              obscureText: bloc.obscureText,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    color: bloc.colorSuffixIcon,
                                    onPressed: () {
                                      setState(() {
                                        if (bloc.icon ==
                                            Icons.remove_red_eye_sharp) {
                                          bloc.icon =
                                              Icons.visibility_off_outlined;
                                          bloc.obscureText = false;
                                        } else {
                                          bloc.icon =
                                              Icons.remove_red_eye_sharp;
                                          bloc.obscureText = true;
                                        }
                                      });
                                    },
                                    icon: Icon(bloc.icon)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                labelText: 'Password',
                                labelStyle: const TextStyle(
                                    fontFamily: 'myfont', color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            TextFormField(
                              focusNode: bloc.foucesPhone,
                              controller: bloc.Phone,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  bloc.Phone;
                                  return 'This field required ';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone_enabled_outlined),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                labelText: 'Phone',
                                labelStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            TextFormField(
                              focusNode: bloc.foucesAddress,
                              controller: bloc.Addrees,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  bloc.Addrees;
                                  return 'Put Your Addrees ';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.location_on),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        const BorderSide(color: Colors.black)),
                                labelText: 'Addrees',
                                labelStyle: const TextStyle(
                                    fontFamily: 'myfont', color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
              ),
            ) ,
            const RegisterButton() ,
          ])),
    );
  }
}
