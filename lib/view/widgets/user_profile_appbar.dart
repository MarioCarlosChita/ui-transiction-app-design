import 'package:flutter/material.dart';


class UserProfileAppBar extends StatelessWidget {
  const UserProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size  media = MediaQuery.of(context).size;

    return Container(
      color: Colors.black,
      width: media.width,
      height: 110,
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _userPerfilPhoto(),
           _userDetailPerfil(),
          _userNotificationUser(),
        ],
      ),
    );
  }

  Widget _userPerfilPhoto(){
    return Container(
      width:50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50) ,
          image: const DecorationImage(
            image: AssetImage("assets/mario_dev.jpeg"),
            fit: BoxFit.cover
          )
      ),

    );
  }

  Widget _userDetailPerfil(){
     return    Expanded(
       flex: 4,
       child: Container(
         padding: const EdgeInsets.only(
             top:32,
             left: 14
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("Welcome Back", style: TextStyle(
               color:Colors.white.withOpacity(0.3),
               fontSize: 14,
             ) ),
             const Text("Mario Chita",style: TextStyle(
                 color:Colors.white,
                 fontSize: 20
             ),)
           ],
         ),
       ),
     );
  }

  Widget _userNotificationUser(){
    return    Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
          top:38,
        ),
        child: const Icon(
          Icons.notifications_active_outlined,
          size:32 ,
          color:Colors.white,
        ),
      ),
    );
  }
}
