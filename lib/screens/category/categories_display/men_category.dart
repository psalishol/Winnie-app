
import 'package:flutter/material.dart';
import '/model/models.dart';
import '/constants/constants.dart';

class MenCategoryDisplay extends StatelessWidget {
  const MenCategoryDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: Text("Men", style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 40, color: AppColors.darkblue, fontWeight: FontWeight.w600),),),
          const SizedBox(height: 10),
          Container(
          
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: men.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 110,
                crossAxisCount: 3), 
              itemBuilder: (context, index){
                return InkWell(
                  onTap: (){},
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          margin: const EdgeInsets.only(right: 10, bottom: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage("images/men/men${index.toString()}.jpg")),
                        ),
                      Text(men[index], style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),)
                      ],
                    ),
                  ),
                );
              })
          )
    
        ],
      ),
    );
  }
}