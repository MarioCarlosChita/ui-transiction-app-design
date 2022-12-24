import 'package:flutter/material.dart';

class MenuAppBar extends StatelessWidget {
  // final IconData icon;
  final String   message;
  final String   imageUrl;
  final Color    color;
  bool  hasTitle ;
  Color textColor ;
  MenuAppBar({
    // required this.icon ,
    required this.message,
    required this.imageUrl,
    required this.color,
    this.hasTitle = false ,
    this.textColor = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height:50,
            width:50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              // color: const Color(0xFF272735)
              color: color
            ),
            child:  Image.asset(imageUrl,fit: BoxFit.contain,),
          ) ,
          const  SizedBox(height:10,),
          !hasTitle  ? Text(message,style:TextStyle(
              color: textColor
          ),): const SizedBox.shrink()
        ],
      ),
    );
  }
}
