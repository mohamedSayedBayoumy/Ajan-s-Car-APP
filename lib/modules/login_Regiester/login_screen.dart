import 'package:flutter/material.dart';

import '../../view/Widget/Widget_login/Login_Button.dart';
import '../../view/Widget/Widget_login/Login_Text.dart';
import '../../view/Widget/Widget_login/TextFileds.dart';

class loginByCustomer extends StatefulWidget {
  @override
  State<loginByCustomer> createState() => _loginState();
}

class _loginState extends State<loginByCustomer> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context1) {
      return Scaffold(
        body: ListView(children: const [
          CustomText(),
          CustomTextfields(),
          ButtonLogin() ,
        ]),
      );
    });
  }
}
