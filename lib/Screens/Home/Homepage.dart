import 'package:e_commerceapp/textwidget/Bigtext.dart';
import 'package:e_commerceapp/textwidget/Smalltext.dart';
import 'package:flutter/material.dart';

import 'Foodpage.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Container(
                margin: const EdgeInsets.only(left: 20,right: 20),
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Bigtext(color: Colors.lightGreen, text: "Kenya",size: 30,),
                        Row(
                          children: [
                            Smalltext(color: Colors.black54, text: "Nairobi"),
                            const Icon(Icons.arrow_drop_down_rounded),
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(

                        height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green,
                          ),
                          child: const Icon(
                              Icons.search,size: 20,color: Colors.white),
                        ),
                    ),
                  ],
                ),
              ),
            ),
            Foodpage(),
          ],
        ),
      ),
    );
  }
}
