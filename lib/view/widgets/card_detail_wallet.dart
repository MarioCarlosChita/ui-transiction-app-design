import 'package:animation_opacity/view/widgets/card_amount_balance.dart';
import 'package:animation_opacity/view/widgets/histogram_balance.dart';
import 'package:flutter/material.dart';


class CardDetailWallet extends StatefulWidget {
  final Color color;
  CardDetailWallet({
    required this.color
  });
  @override
  State<CardDetailWallet> createState() => _CardDetailWalletState();
}

class _CardDetailWalletState extends State<CardDetailWallet> {
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    return Container(
       width: media.width,
       height: 290,
       child: Stack(
         children:  [
           const Positioned(
               top:130,
               left: 0,
               right: 0,
               child: HistogramBalance()
           ),
           CardAmountBalance(color: widget.color)
         ],
       ),
    );
  }
}
