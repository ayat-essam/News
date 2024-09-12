import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../sources/data/model/NewsResponse.dart';

class articleImage extends StatelessWidget {
  static const String routeName = '/articleImage';


  const articleImage(this.article, {super.key});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            article.url ??
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWz9tftw9qculFH1gxieWkxL6rbRk_hrXTSg&s',
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
          ),
          const SizedBox(height: 4),
          Text(
            article.source.name ?? '',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: appTheme.gray,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            article.title ?? '',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              timeago.format(DateTime(2024, 8, 31, 10)),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: appTheme.gray,
                  fontSize: 14
              ),
            ),
          ),
        ],
      ),
    );
  }
}



