import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_db_sqflite/models/models.dart';
import 'package:sample_db_sqflite/services/services.dart';

part 'list_news_event.dart';
part 'list_news_state.dart';

class ListNewsBloc extends Bloc<ListNewsEvent, ListNewsState> {
  ListNewsBloc() : super(ListNewsInitial()) {
    on<ListNewsEvent>((event, emit) {
      
    });
    on<GetIntNews>(_getIntNews);
  }

  Future<void> _getIntNews(GetIntNews event,Emitter<ListNewsState> emit)async{
    try{
      emit(ListNewsLoading());
      List<News> listNews=await NewsServices.getIntNews();
      emit(ListNewsLoaded(listNews));
    }catch(e){
      emit(ListNewsError(e.toString()));
    }
  }
}
