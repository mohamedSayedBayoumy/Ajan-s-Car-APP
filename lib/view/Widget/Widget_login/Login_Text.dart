import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .25,
            right: MediaQuery.of(context).size.width * .03,
            left: MediaQuery.of(context).size.width * .03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: TextStyle(fontFamily: 'Poppins', fontSize: 50),
            ),
            Text('To back your account and all your Data you Saved'),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            )
          ],
        )) ;
  }
}
