import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  String tag;
  Screen2(this.tag);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
            body:
              
              Container(
                padding:const EdgeInsets.all(40),
                width: size.width,
                height: size.height,
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    
                    IconButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, icon: Icon(Icons.arrow_back_ios_new_rounded,),color: Colors.white,iconSize: 30,),
                   const Text("Back",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)
                  ],
                ),
                decoration:  BoxDecoration(
        image: DecorationImage(image:AssetImage("assets/"+tag+".jpg") ,fit: BoxFit.cover,)
    ),
              
            ),);
  }
}