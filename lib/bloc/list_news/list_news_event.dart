part of 'list_news_bloc.dart';

abstract class ListNewsEvent extends Equatable {
  const ListNewsEvent();

  @override
  List<Object> get props => [];
}

class GetIntNews extends ListNewsEvent {


  const GetIntNews();

  @override
  List<Object> get props => [];
}
