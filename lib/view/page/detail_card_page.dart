import 'package:animation_opacity/view/page/home_page.dart';
import 'package:animation_opacity/view/widgets/card_detail_wallet.dart';
import 'package:flutter/material.dart';

class DetailCardPage extends StatefulWidget {
  const DetailCardPage({Key? key}) : super(key: key);

  @override
  State<DetailCardPage> createState() => _DetailCardPageState();
}

class _DetailCardPageState extends State<DetailCardPage> {
  @override
  Widget build(BuildContext context) {
    Size media =MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: media.width,
          height: media.height,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:  MainAxisAlignment.start,
            children:  [
              const  Text("My Wallet",style:TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 42,
                color: Colors.black,
              ),) ,
              const SizedBox(height:8,),
              Text("Select a Card for more detail Information" ,style: TextStyle(
                color: Colors.grey.withOpacity(0.8),
                fontSize: 14
              ),) ,
              const SizedBox(height:10,),
              Container(
                width: media.width,
                height: 558,
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index){
                      return CardDetailWallet(color: Colors.primaries[index],);
                    }
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: media.width,
        height: 190,
        padding: const EdgeInsets.only(
            left: 20,
            right:20  ,
            bottom: 20
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Container(
              width: media.width,
              color: Colors.white,
              padding: const EdgeInsets.only(
                 bottom: 10
              ),
              child: MaterialButton(
                height: 60,
                shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                ),
                onPressed: (){} ,
                color: const  Color(0xFF2c64ff),
                child: const Text("ADD A CARD",style: TextStyle(
                   color: Colors.white,
                   fontSize: 16
                ),),
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: ()=>Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_)=> const HomePage())),
                  child: _menuButton(
                    imageUrl: "assets/home_menu.png",
                    title:"Home",
                  ),
                ),
                _menuButton(
                    imageUrl: "assets/wallet_menu.png",
                    title: "Wallet"
                ),
                _menuButton(
                    imageUrl:"assets/estatistica.png",
                    title: "Statistic"
                ) ,
                _menuButton(
                    imageUrl: "assets/profile.png",
                    title: "Profile"
                )
              ],
            ) ,
          ],
        ),
      ),
    );
  }

  Widget _menuButton({required String imageUrl ,required String title}){
    return Container(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height:45,
            decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
            ) ,
            child:Image.asset(imageUrl),
          ),
          const SizedBox(height:05),
          Text(title,style: const TextStyle(
              color: Colors.black,
              fontSize: 11
          ),)
        ],
      ),
    );
  }
}
