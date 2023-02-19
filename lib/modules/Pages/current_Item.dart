import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/Bloc/Cubit/Bloc_Cubit.dart';

class currentItem extends StatefulWidget {
  dynamic image;
  dynamic Brand;
  dynamic descraption;
  dynamic model;
  dynamic price;
  dynamic offer;
  currentItem({
    required this.image,
    required this.Brand,
    required this.descraption,
    required this.model,
    required this.price,
  });

  @override
  State<currentItem> createState() => _currentItemState(
        image,
        Brand,
        descraption,
        model,
        price,
      );
}

class _currentItemState extends State<currentItem> {
  dynamic image;
  dynamic Brand;
  dynamic descraption;
  dynamic model;
  dynamic price;

  _currentItemState(
      this.image, this.Brand, this.descraption, this.model, this.price);

  Color x = Colors.white;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<cubitBottom>(context);
    bloc.model.text = model;
    bloc.descraption.text = descraption;
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
                              price,
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
