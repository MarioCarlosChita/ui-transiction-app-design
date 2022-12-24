import 'package:flutter/material.dart';

class CardAmountBalance extends StatelessWidget {
  final Color color ;
  const CardAmountBalance({
    this.color =  const  Color(0xFF2c64ff)
  });
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Container(
      width: media.width,
      height: 180,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text("TotalBalance" ,style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 17,
          ),),
          const SizedBox(height: 15,),
          RichText(text: const TextSpan(
                 text: "\$",
                 style:TextStyle(
                    color: Colors.white,
                    fontSize:22
                ),
                 children: [
                   TextSpan(
                     text:"20,120.00",
                     style: TextStyle(
                         color: Colors.white,
                         fontSize: 32
                     ),
                   ),
                 ]
              )),
          const SizedBox(height: 8),
          Container(
             height: 45,
             width: 300, 
             decoration: BoxDecoration(
               color: Colors.black, 
               borderRadius: BorderRadius.circular(50)
             ),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment:MainAxisAlignment.center,
               children:  [
                 const Text("Revenue",style:  TextStyle(
                   color: Colors.white,
                   fontSize: 16
                 ),) ,
                  Text("+7% From LastWeek" ,style:  TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 18,
                  ),)
               ],
             ),
          )
        ],
      ),
    );
  }
}
