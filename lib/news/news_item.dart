import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/widget/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../sources/data/model/NewsResponse.dart';


class  newsItem extends StatelessWidget {
  const newsItem(
      this.article,
      {super.key, });
   final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(vertical: 16, horizontal: 24) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: CachedNetworkImage(imageUrl: article.urlToImage ?? '',
                  //'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWz9tftw9qculFH1gxieWkxL6rbRk_hrXTSg&s',
              placeholder: (_, __) => loadingIndicator() ,
              errorWidget: (_, __, ___) => Icon(Icons.image_not_supported_outlined,
              size: 32,),
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,),
          ),
               const SizedBox(height: 4,),
              Text(article.source.name ?? '',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: appTheme.gray,fontSize: 10),),
             const SizedBox(height: 4,),
              Text(article.title?? '',
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


