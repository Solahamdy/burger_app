import 'package:flutter/material.dart';
import 'package:sixth_app/screens/login_screen.dart';
class TextLoginField extends StatelessWidget{
  var icon ;
  String text ;
  var validator ;

  TextLoginField(this.icon, this.text, this.validator,{super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        validator: validator,
        textDirection: TextDirection.ltr,
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.grey,)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.orange)),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
              borderSide:const BorderSide(color: Colors.red,)),
          suffixIcon: Icon(icon , color: Colors.grey,),
          hintText: text ,
          hintTextDirection: TextDirection.ltr,

        ),

      ),
    );
  }
}