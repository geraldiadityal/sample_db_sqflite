import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_db_sqflite/models/models.dart';
import 'package:sample_db_sqflite/services/services.dart';

part 'detail_news_event.dart';
part 'detail_news_state.dart';

class DetailNewsBloc extends Bloc<DetailNewsEvent, DetailNewsState> {
  DetailNewsBloc() : super(DetailNewsInitial()) {
    on<DetailNewsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetDetailNews>(_getDetails);
  }
  Future<void> _getDetails(GetDetailNews event,Emitter<DetailNewsState> emit)async{
    try{
      emit(DetailNewsLoading());
      DetailNews dataDetails=await DetailNewsServices.getDetail(event.links);
      emit(DetailNewsLoaded(dataDetails));
    }catch(e){
      emit(DetailNewsError(e.toString()));
    }
  }
}
