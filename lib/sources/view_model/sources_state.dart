
import 'package:news/sources/data/model/SourcesResponse.dart';

abstract class SourcesState{}

 class SourceInitial extends SourcesState{}

 class GetSourceLoading extends SourcesState{}
 class GetSourceError extends SourcesState{
  final message;
  GetSourceError(this.message);
 }
 class GetSourceSucces extends SourcesState{
 final List<Sources> sources ;
  GetSourceSucces(this.sources);
 }