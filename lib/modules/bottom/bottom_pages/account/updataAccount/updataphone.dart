import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled73/modules/bottom/bottom_pages/account/account.dart';

import '../../../../../shared/Bloc/Cubit/Bloc_Cubit.dart';

class updataphone extends StatefulWidget {
  dynamic data;
  dynamic dox;
  updataphone({this.data, this.dox});

  @override
  State<updataphone> createState() => _updataphoneState(data, dox);
}

class _updataphoneState extends State<updataphone> {
  dynamic data;
  dynamic dox;
  _updataphoneState(this.data, this.dox);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<cubitBottom>(context);

    return Scaffold(
        body: Center(
            child: Container(
      height: MediaQuery.of(context).size.height * .3,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(25)),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .05,
          vertical: MediaQuery.of(context).size.height * .05),
      child: Theme(
        data: Theme.of(context)
            .copyWith(colorScheme: ColorScheme.light(primary: Colors.black)),
        child: Column(children: [
          TextFormField(
            style: TextStyle(color: Colors.black),
            controller: bloc.defaultt,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.manage_accounts_rounded),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.black)),
              labelText: 'updata',
              labelStyle: TextStyle(fontFamily: 'myfont', color: Colors.black),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection('Emails')
                  .doc(dox)
                  .update(<String, dynamic>{
                'phone': bloc.defaultt.text,
              }).then((value) async {
                await bloc.currentuser.currentUser!
                    .updatePassword(bloc.defaultt.text.trim())
                    .whenComplete(() {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: account(),
                          type: PageTransitionType.leftToRight));
                });
              });
            },
            child: Text('Updata'),
          ),
        ]),
      ),
    )));
  }
}
