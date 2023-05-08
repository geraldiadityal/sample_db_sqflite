import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_db_sqflite/models/models.dart';
import 'package:sample_db_sqflite/models/news/news.dart';
import 'package:sample_db_sqflite/services/services.dart';

part 'list_news_event.dart';
part 'list_news_state.dart';

class ListNewsBloc extends Bloc<ListNewsEvent, ListNewsState> {
  ListNewsBloc() : super(ListNewsInitial()) {
    on<ListNewsEvent>((event, emit) {});
    on<GetIntNews>(_getIntNews);
  }

  void _getIntNews(GetIntNews event, Emitter<ListNewsState> emit) async {
    emit(ListNewsLoading());
    try {
      DataNews NewsData = await NewsServices.getIntNews();
      if (NewsData.status != 200) {
        throw ('Status bukan 200');
      }
      emit(ListNewsLoaded(NewsData.data!));
    } catch (e) {
      emit(ListNewsError(e.toString()));
    }
  }
}
