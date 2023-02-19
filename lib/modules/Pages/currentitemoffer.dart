import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/Bloc/Cubit/Bloc_Cubit.dart';

class currentItemoffer extends StatefulWidget {
  dynamic image;
  dynamic Brand;
  dynamic descraption;
  dynamic model;
  dynamic price;
  dynamic offer;
  currentItemoffer(
      {required this.image,
      required this.Brand,
      required this.descraption,
      required this.model,
      required this.price,
      required this.offer});

  @override
  State<currentItemoffer> createState() =>
      _currentItemofferState(image, Brand, descraption, model, price, offer);
}

class _currentItemofferState extends State<currentItemoffer> {
  dynamic image;
  dynamic Brand;
  dynamic descraption;
  dynamic model;
  dynamic price;
  dynamic offer;
  _currentItemofferState(this.image, this.Brand, this.descraption, this.model,
      this.offer, this.price);

  Color x = Colors.white;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<cubitBottom>(context);

    return Scaffold(
        backgroundColor: Colors.indigo.shade700,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 20,
        ),
        body: ListView(
          children: [
            Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(0))),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: MediaQuery.of(context).size.height * .03,
                        right: MediaQuery.of(context).size.width * .05,
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * .1,
                              decoration: BoxDecoration(
                                  color: Colors.grey, shape: BoxShape.circle),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (x == Colors.white) {
                                        x = Colors.red.shade700;
                                        bloc.sqlite(
                                          image: image,
                                          model: model,
                                          price: price,
                                          Brand: Brand,
                                          descraption: descraption,
                                        );
                                      } else {
                                        x == Colors.redAccent.shade700;
                                      }
                                      ;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: x,
                                  )),
                            ),
                          ],
                        )),
                    Positioned(
                        bottom: MediaQuery.of(context).size.height * .02,
                        left: MediaQuery.of(context).size.width * .0,
                        child: Container(
                          width: MediaQuery.of(context).size.width * .95,
                          height: MediaQuery.of(context).size.height * .07,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.redAccent.shade700,
                              shape: BoxShape.circle),
                          child: offer == ' '
                              ? null
                              : Container(
                                  width:
                                      MediaQuery.of(context).size.width * .95,
                                  height:
                                      MediaQuery.of(context).size.height * .07,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent.shade700,
                                      shape: BoxShape.circle),
                                  child: Text(
                                    price,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                        )),
                    Positioned(
                        child: Container(
                            child: Hero(
                                tag: NetworkImage(image),
                                child: Image.network(image)))),
                    Positioned(
                        bottom: MediaQuery.of(context).size.height * .09,
                        left: MediaQuery.of(context).size.width * .05,
                        child: Text(
                          Brand,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'poppins',
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                    Positioned(
                        bottom: MediaQuery.of(context).size.height * .04,
                        left: MediaQuery.of(context).size.width * .05,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price : ',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              offer,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'poppins',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .05),
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      enabled: false,
                      controller: bloc.model,
                      decoration: InputDecoration(
                        labelText: 'model',
                        labelStyle: TextStyle(
                            fontFamily: 'poppins',
                            color: Colors.white,
                            fontSize: 25),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      enabled: false,
                      controller: bloc.descraption,
                      decoration: InputDecoration(
                        labelText: 'About',
                        labelStyle: TextStyle(
                            fontFamily: 'poppins',
                            color: Colors.white,
                            fontSize: 25),
                        border: UnderlineInputBorder(),
                      ),
                      minLines: bloc.descraption.text.length.sign,
                      maxLines: bloc.descraption.text.length,
                    ),
                  ],
                ),
              ),
            ])
          ],
        ));
  }
}
