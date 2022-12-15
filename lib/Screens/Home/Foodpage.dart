import 'package:e_commerceapp/textwidget/Bigtext.dart';
import 'package:e_commerceapp/textwidget/IconText.dart';
import 'package:e_commerceapp/textwidget/Smalltext.dart';
import 'package:flutter/material.dart';
class Foodpage extends StatefulWidget {
   Foodpage({Key? key}) : super(key: key);
  @override
  State<Foodpage> createState() => _FoodpageState();
}

class _FoodpageState extends State<Foodpage> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;
  @override
  void initstate(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }
  @override
  void dispose(){
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      //color: Colors.lightGreen,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
          itemBuilder: (context,position){
        return _itembuilder(position);
      }),
    );
  }
  Widget _itembuilder(int index){
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height *(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor + (_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height *(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height *(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,_height*(1-_scaleFactor)/2, 1);
    }
    return  Transform(
      transform: matrix,
      child: Stack(
        children: [
        Container(
        height: 220,
        margin:const  EdgeInsets.only(left: 10,right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven?Colors.blueAccent:Colors.yellowAccent,
            image:const  DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  "Assets/Images/best.jpg"
              ),
            )
        ),
      ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin:const  EdgeInsets.only(left: 20,right: 20,bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 10.0,
                    offset: Offset(5, 5),
                  ),
                ]
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Bigtext(color: Colors.black, text: "Chinese Fruits"),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) =>
                             const Icon(Icons.star,color: Colors.lightGreen,size: 15,)
                          ),
                        ),
                       const SizedBox(width: 10),
                        Smalltext(color: Colors.black87, text: "4.5"),
                        const SizedBox(width: 10),
                        Smalltext(color: Colors.black87, text: "1287"),
                        const SizedBox(width: 10),
                        Smalltext(color: Colors.black87, text: "Comments"),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: const[
                        IconText(
                            color: Colors.black87,
                            icon: Icons.circle_rounded,
                            text: "Normal",
                            Iconcolor: Colors.purple),
                        SizedBox(width: 10),
                        IconText(
                            color: Colors.black87,
                            icon: Icons.location_on,
                            text: "1.74 kM",
                            Iconcolor: Colors.greenAccent),
                        SizedBox(width: 10,),
                        IconText(
                            color: Colors.black87,
                            icon: Icons.access_time_rounded,
                            text: "32 min",
                            Iconcolor: Colors.purpleAccent),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
