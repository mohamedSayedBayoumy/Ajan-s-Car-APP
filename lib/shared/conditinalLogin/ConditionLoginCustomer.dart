import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modules/bottom/bottom.dart';
import '../../modules/login_Regiester/login_screen.dart';


class ConditionLoginCustomer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context , snapshot){
          if(snapshot.hasData){
            return bottom() ;
          }else{
            return loginByCustomer();
          }
        },
      ),
    );
  }
}
