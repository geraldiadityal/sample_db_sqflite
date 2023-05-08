part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final String link;
  const DetailPage({super.key, required this.link});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLoaded = false;
  DataDetail? dataDetail;

  @override
  void initState() {
    super.initState();
    context.read<DetailNewsBloc>().add(GetDetailNews(widget.link));
  }

  void showSnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () async {
          if (dataDetail != null && isLoaded) {
            await LocalDatabase.addFavorite(dataDetail!);
            showSnackbar(context, 'Berhasil di tambahkan');
          }
        },
        child: Icon(Icons.favorite),
      ),
      body: SafeArea(
        child: BlocBuilder<DetailNewsBloc, DetailNewsState>(
          builder: (context, state) {
            if (state is DetailNewsLoading) {
              return CircularProgressIndicator();
            } else if (state is DetailNewsError) {
              return Center(child: Text(state.msg));
            } else if (state is DetailNewsLoaded) {
              DataDetail data = state.dataDetail;
              dataDetail = data..link = widget.link;
              isLoaded = true;

              return Container(
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    Text(data.judul!),
                    Divider(),
                    Expanded(
                      child: Text(data.body!),
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
