part of 'detail_news_bloc.dart';

abstract class DetailNewsState extends Equatable {
  const DetailNewsState();

  @override
  List<Object> get props => [];
}

class DetailNewsInitial extends DetailNewsState {}

class DetailNewsLoading extends DetailNewsState {}

class DetailNewsError extends DetailNewsState {
  final String msg;

  DetailNewsError(this.msg);
  List<Object> get props => [msg];
}

class DetailNewsLoaded extends DetailNewsState {
  final DataDetail dataDetail;

  DetailNewsLoaded(this.dataDetail);

  @override
  List<Object> get props => [dataDetail];
}
