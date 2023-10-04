import 'package:flutter/material.dart';
class MenuCategories extends StatelessWidget {
  String text ;
  String image;
  var color ;

  MenuCategories({required this.text, required this.image,this.color});

  @override
  Widget build(BuildContext context) {
     return Container(
       height: 70,
       width: 90,
       decoration: BoxDecoration(
         border: Border.all(color: Colors.grey),
         color: color,
         borderRadius: BorderRadius.circular(15)
       ),
       child: Center(
         child: Column(mainAxisAlignment:MainAxisAlignment.center ,
           children: [
             IconButton(onPressed: (){},
                 icon: Image( image: AssetImage(image),
                   color: Colors.grey.shade600 , height: 40,
                 )),
              Text( text, style: const TextStyle(
               color: Colors.black,
             fontSize: 15 ,fontWeight: FontWeight.bold
             ),)
           ],
         ),
       ),
     )
     ;
  }

}