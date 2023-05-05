part of 'list_news_bloc.dart';

abstract class ListNewsState extends Equatable {
  const ListNewsState();

  @override
  List<Object> get props => [];
}

class ListNewsInitial extends ListNewsState {}

class ListNewsLoading extends ListNewsState {}

class ListNewsError extends ListNewsState {
  final String msg;

  ListNewsError(this.msg);
  List<Object> get props => [msg];
}

class ListNewsLoaded extends ListNewsState {
  final List<News> listNews;

  ListNewsLoaded(this.listNews);

  @override
  List<Object> get props => [listNews];
}
