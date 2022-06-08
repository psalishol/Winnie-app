

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../constants/constants.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.white,
        leading: Row(
          children: [
            const SizedBox(width: 15,),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(Icons.arrow_back_ios, color: AppColors.darkblue, size: 20,)),
          ],
        ),
        leadingWidth: 35,
        title: Text("Profile", style: TextStyle(color: AppColors.darkblue, fontFamily: 'Poppins', fontSize: 18)),
        automaticallyImplyLeading: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 40,),
          Row(children:  [
              const SizedBox(width: 10,),
             Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30)
              ),
              child: const Image(
                fit: BoxFit.cover,
                image: AssetImage("images/inapp/google.jpg")),
            ),
            const SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Text("Psalishol Samuel", style: Theme.of(context).textTheme.headline4!.copyWith(color: AppColors.darkblue),),
              const SizedBox(height: 5,),
              Text("@psalishol",style: Theme.of(context).textTheme.headline6!.copyWith(color: AppColors.grey) )
            ],)
          ],),
        const SizedBox(height: 20,),
        profileDetail(context, "Gender",Icons.male,"Male"),
        profileDetail(context, "Birthday",Icons.calendar_month_outlined,"12-12-2000"),
        profileDetail(context, "Email",Icons.mail,"Psalishol80@gmail.com"),
        profileDetail(context, "Phone Number",Icons.phone_android_outlined,"081-095-9232"),
        profileDetail(context, "Change Password",Icons.lock_outlined,"*************"),
          ]),
      )
  );
}


  Widget profileDetail(
      BuildContext context, 
      String name, 
      IconData detailIcon, 
      String selectedChoice) {
    return InkWell(
    onTap: (){
    //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => route));
    },
    child: Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(children: [
                Icon(detailIcon, color: AppColors.blue, size: 26,),
                const SizedBox(width: 15,),
                Text(name, style: Theme.of(context).textTheme.headline6!.copyWith(color: AppColors.darkblue),),
              ],),  
            ),
          SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(selectedChoice, style: Theme.of(context).textTheme.headline6!.copyWith(color: AppColors.grey),),
                  const SizedBox(width: 10,),
                  Icon(Icons.arrow_forward_ios, color: AppColors.grey, size: 20,),
                ],),
              )
          ]),
         )
      );
  }
}