

import 'package:flutter/material.dart';

class HistogramBalance extends StatelessWidget {
  const HistogramBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size  media =MediaQuery.of(context).size;
    return Container(
       width: 390,
       height: 120,
       // margin: const  EdgeInsets.only(right:20 ),
       padding: const EdgeInsets.only(right:12, bottom: 10),
       decoration:  BoxDecoration(
         color: const Color(0xFF272735) ,
         border: Border.all(color: Colors.white.withOpacity(0.1)),
         borderRadius: const BorderRadius.only(
           bottomLeft: Radius.circular(25),
           bottomRight: Radius.circular(25),
         )
       ),
       alignment: Alignment.bottomCenter,
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.end,
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
             Expanded(
               flex: 1,
               child:Container(
                 child: _histogramModel(),
               ),
             ),
             Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 5 ,
                    left: 12
                  ),
                  child: _descritionHistogram(),
                )
            ),
             Expanded(
              flex: 1,
              child:  _buttonDescritionHistogram(),
            ) 
         ],
       ),
    );
  }

  Widget _histogramModel(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 50,
          padding: const EdgeInsets.only(left: 10 ,top: 5),
          child: Image.asset(
            "assets/histogram_ui.png" ,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }

  Widget _descritionHistogram(){
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.end,
       children:  [
          Text("Expenditure" , style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 16
          ),),
          const  SizedBox(height:2),
          const  Text("+5.1%" ,style: TextStyle(
            color: Colors.white
         ),)
       ],
     ) ;
  }
  Widget _buttonDescritionHistogram(){
    return Container(
      child: MaterialButton(
        onPressed: (){},
        minWidth: 80,
        height:40,
        color:Colors.black.withOpacity(0.2),
        shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(50)
        ),
        child: const Text("ViewFull",style: TextStyle(
           color: Colors.white,
           fontSize: 14 ,
           fontWeight: FontWeight.w500
        ),),
      ),
    );
  }

}
