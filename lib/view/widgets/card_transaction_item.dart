
import 'package:animation_opacity/view/model/transition.dart';
import 'package:flutter/material.dart';

class CardTransaction extends StatelessWidget {
  final Transiction  transiction;
  CardTransaction({required this.transiction});


  @override
  Widget build(BuildContext context) {
    return Material(
       shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(18)
       ),
       child: Container(
         height:95,
         padding: const EdgeInsets.only(
             bottom: 10,
             right: 20,
             left: 20,
             top: 10
         ),
         decoration:  BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(18)
         ),
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
               Container(
                 width: 62,
                 height:62,
                 decoration: BoxDecoration(
                   color: const  Color(0xFFf6f6f6),
                   borderRadius: BorderRadius.circular(50)
                 ),
                 child: Image.asset(transiction.transictionImageUrl)
               )  ,
               Expanded(
                  flex:4,
                  child: Container(
                    padding: const EdgeInsets.only(
                       left: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text(transiction.title,style: TextStyle(
                          color: Colors.grey.withOpacity(0.7),
                          fontSize: 16
                        ),),
                        Text(transiction.emissor,style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ) ,
                  ),
               ),
               Expanded(
                  flex:2,
                  child: Container (
                     alignment: Alignment.center,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children:[
                           Text(transiction.amountTransiction,style: const TextStyle(
                            color: Colors.black ,
                            fontWeight: FontWeight.w400 ,
                            fontSize: 20
                          ),)
                       ],
                     ),
                  ),
               )
           ],
         ),
       ),
    );
  }
}
