

import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AccountElements extends StatelessWidget {
  final String name;
  final IconData icon;
  Widget route;
  AccountElements({
    Key? key,
    required this.name,
    required this.icon,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       Navigator.of(context).push(MaterialPageRoute(builder: (context) => route));
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Icon(icon, color: AppColors.blue, size: 26,),
          const SizedBox(width: 30,),
          Text(name, style: Theme.of(context).textTheme.headline5!.copyWith(color: AppColors.darkblue),)
        ],),
      ),
    );
  }
}
