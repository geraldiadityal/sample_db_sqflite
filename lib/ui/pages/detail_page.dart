part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final String link;
  const DetailPage({super.key, required this.link});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<DetailNewsBloc>().add(GetDetailNews(widget.link));
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.favorite),
      ),
      body: SafeArea(
        child: BlocBuilder<DetailNewsBloc, DetailNewsState>(
          builder: (context, state) {
            if (state is DetailNewsLoading) {
              return CircularProgressIndicator();
            } else if (state is DetailNewsError) {
              return Icon(Icons.error);
            } else if (state is DetailNewsLoaded) {
              DetailNews data = state.dataDetail;
              return Container(
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    Text(data.judul),
                    Divider(),
                    Expanded(
                      child: Text(data.body),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
