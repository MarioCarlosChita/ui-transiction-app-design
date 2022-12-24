import 'package:animation_opacity/view/page/detail_card_page.dart';
import 'package:animation_opacity/view/widgets/card_amount_balance.dart';
import 'package:animation_opacity/view/widgets/card_transaction_item.dart';
import 'package:animation_opacity/view/widgets/histogram_balance.dart';
import 'package:animation_opacity/view/widgets/menu_app_bar.dart';
import 'package:animation_opacity/view/widgets/user_profile_appbar.dart';
import 'package:flutter/material.dart';
import '../../util/constants.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController  controller = ScrollController(keepScrollOffset: true);
  bool maxHeightTooked=false;
  bool maxHeightMenu  = false;
  bool maxHeightContainer = false;

  @override
  void initState() {
    super.initState();
    _onListScrollAnimation();
  }

  void  _onListScrollAnimation(){
    controller.addListener(() {
      if (controller.offset.toInt() > 400){
        maxHeightTooked  = true;
        setState(() {});
      } else {
        maxHeightContainer = false;
        setState(() {});
      }
    });
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size media =MediaQuery.of(context).size;
    return Scaffold(
       backgroundColor: const Color(0xFFf6f6f6),
       body: SingleChildScrollView(
          child: Container(
            width: media.width,
            height: media.height,
            color: const Color(0xFFf6f6f6),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                const  UserProfileAppBar(),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: media.width,
                  onEnd: (){
                    if (!maxHeightContainer) {
                      setState(() {
                        maxHeightMenu =  false;
                      });
                    }
                  },
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30)
                      )
                  ),
                  height:  maxHeightContainer ?  210 :400,
                  padding: const EdgeInsets.all(20),
                  child: Stack(
                    children:  [
                      AnimatedPositioned(
                          duration: const Duration(milliseconds: 180),
                          top: maxHeightMenu ?  10 :270,
                          left: 0,
                          right: 0,
                          onEnd: (){
                            if (maxHeightMenu ){
                              setState(() {
                                maxHeightContainer  = true;
                              });
                            }
                            if (!maxHeightMenu) {
                              maxHeightTooked = false;
                              setState(() {});
                            }
                          },
                          child:Container(
                            width: media.width,
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MenuAppBar(
                                  imageUrl: "assets/send.png",
                                  message: "Send" ,
                                  color: const Color(0xFF272735),
                                ) ,
                                MenuAppBar(
                                  imageUrl: "assets/request.png",
                                  message: "Request" ,
                                  color: const Color(0xFF272735),
                                ),
                                MenuAppBar(
                                  imageUrl: "assets/scanner.png",
                                  message: "ScanQR" ,
                                  color: const Color(0xFF272735),
                                ) ,
                                MenuAppBar(
                                  imageUrl: "assets/more.png",
                                  message: "More" ,
                                  color: const Color(0xFF272735),
                                )
                              ],
                            ),
                          )
                      ),
                      AnimatedPositioned(
                        onEnd: (){
                          if (maxHeightTooked){
                            maxHeightMenu =true;
                            setState(() {});
                          } else {
                            // maxHeightMenu =false;
                            // setState(() {});
                          }
                        },
                        duration: const Duration(milliseconds:180) ,
                        top: maxHeightTooked ? 10 :130,
                        child: const HistogramBalance(),
                      ),
                      const  CardAmountBalance(),
                    ],
                  ),
                ),
                const  SizedBox(height:40,) ,
                _recentTransaction(),
                const SizedBox(height:20,),
                _detailTransaction() ,
                Container(
                  height: 310,
                  padding: const EdgeInsets.only(left:10, right:10),
                  child: ListView.separated(
                      controller: controller,
                      separatorBuilder: (context ,index)=> const SizedBox(height:20,),
                      padding: const  EdgeInsets.only(top:15),
                      itemCount: LIST_TRANSICTION.length ?? 0,
                      itemBuilder: (context,index){
                        return   CardTransaction(transiction: LIST_TRANSICTION[index],);
                      }
                  ),
                )
              ],
            ),
          ) ,
       ),
       bottomNavigationBar: Container(
          width: media.width,
          height: 120,
          color: Colors.white,
          padding: const EdgeInsets.only(
              top:20,
              left: 20,
              right:20  ,
              bottom: 20
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _menuButton(
                  imageUrl: "assets/home.png",
                  title:"Home"
              ),
              InkWell( 
                onTap: ()=>Navigator.of(context)
                .push(MaterialPageRoute(builder: (_)=>const DetailCardPage())),
                child: _menuButton(
                    imageUrl: "assets/carteira.png",
                    title: "Wallet"
                ),
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


  Widget  _recentTransaction() {
    return Container(
      padding: const EdgeInsets.only(
          left: 10,
          right: 10
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Recent Transaction", style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.w400
          ),),
          Text("See More", style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 16
          ),),
        ],
      ),
    );
  }
  Widget _detailTransaction(){
    return  Container(
      padding: const EdgeInsets.only(
          left: 10,
          right: 10
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Text("Moday", style: TextStyle(
              color: Colors.grey.shade500 ,
              fontSize: 15
          ),),
          Text("7 Activity", style: TextStyle(
              color: Colors.grey.shade500 ,
              fontSize: 15
          ),)
        ],
      ),
    );
  }
}
