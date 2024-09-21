
import 'package:news/sources/data/model/NewsResponse.dart';

abstract class NewsState{}

class NewsInitial extends NewsState{}

class GetNewsLoading extends NewsState{}
class GetNewsError extends NewsState{
  final message;
  GetNewsError(this.message);
}
class GetNewsSucces extends NewsState{
  final List<Article> articleList ;
  GetNewsSucces(this.articleList);
}