import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;


class newsItem extends StatelessWidget {
  const newsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(vertical: 16, horizontal: 24) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/image/NewsTest.png',
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,),
          const SizedBox(height: 4,),
          Text("BBC News",style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: appTheme.gray,fontSize: 10),),
         const SizedBox(height: 4,),
          Text("Why are football's biggest clubs starting a new  "
              " tournament?",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500 ),

          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(timeago.format(DateTime(2024, 8, 31,10)),style:
              Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: appTheme.gray, fontSize: 14),),
          )
        ],
      ),

    );
  }
}
