import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/sources/data/repo/repo_sources.dart';
import 'package:news/sources/data/service_locator.dart';
import 'package:news/sources/view_model/sources_state.dart';


class sourceViewModel extends Cubit<SourcesState> {
  late final sourcesRepo response;

  sourceViewModel() : super(SourceInitial()) {
    response = sourcesRepo(ServiceLocator.sourcsDataSource);
  }

  Future<void> getSource(String catId) async {
    emit(GetSourceLoading());
    try {
      final Sources = await response.getSources(catId);
      emit(GetSourceSucces(Sources));
    }
    catch (error) {
      emit(GetSourceError(error.toString()));
    }
  }

}

