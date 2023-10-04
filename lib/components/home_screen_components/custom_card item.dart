import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixth_app/blocs/app_cubit/app_cubit.dart';

class CustomCardItem extends StatelessWidget {
  String? name;
  String? weight;
  double? price;
  String? oldPrice;
  String? image;
  bool isOffer = true;
   var func ;
  String? offer;
  bool isFavorite = false;
  final Function(double amount) addToTotal;


  CustomCardItem({this.name,
    this.weight,
    this.price,
    this.image,
    this.oldPrice,
    required this.isOffer,
    this.offer,
    required this.addToTotal,this.func,required this.isFavorite,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Column(
        children: [
          Stack(
            children: [
              Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon( isFavorite? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed:func
                      )),

              if (isOffer)
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      height: 30,
                      width: 70,
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topLeft: Radius.circular(10))),
                      child: Center(
                          child: Text(
                            offer!,
                            style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                          ))),
                )
            ],
          ),
          Image(
            image: AssetImage(image!),
            width: 80,
            height: 80,
          ),
          Text(name!,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          Text(weight!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              )),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('\$ $price',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                  )),
              const SizedBox(
                width: 10,
              ),
              Text(oldPrice!,
                  style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 15,
                      decoration: TextDecoration.lineThrough)),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                addToTotal(price!);
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                child: const Align(
                  alignment: Alignment.center,
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
