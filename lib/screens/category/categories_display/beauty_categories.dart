
import 'package:flutter/material.dart';
import '/model/models.dart';
import '/constants/constants.dart';

class BeautyCategoryDisplay extends StatelessWidget {
  const BeautyCategoryDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          child: Text("Beauty", style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 40, color: AppColors.black, fontWeight: FontWeight.w600),),),
        const SizedBox(height: 10),
        Container(
        
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 6,
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
                          image: AssetImage("images/beauty/beauty${index.toString()}.jpg")),
                      ),
                    Text(men[index], style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),)
                    ],
                  ),
                ),
              );
            })
        )

      ],
    );
  }
}