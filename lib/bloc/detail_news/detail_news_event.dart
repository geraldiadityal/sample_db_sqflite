part of 'detail_news_bloc.dart';

abstract class DetailNewsEvent extends Equatable {
  const DetailNewsEvent();

  @override
  List<Object> get props => [];
}

class GetDetailNews extends DetailNewsEvent {
  final String links;

  const GetDetailNews(
    this.links
  );

  @override
  List<Object> get props => [links];
}

