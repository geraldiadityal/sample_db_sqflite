part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    context.read<ListNewsBloc>().add(GetIntNews());
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.white,
          child: BlocBuilder<ListNewsBloc, ListNewsState>(
            builder: (context, state) {
              if (state is ListNewsLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: accentColor1,
                  ),
                );
              } else if (state is ListNewsLoaded) {
                List<News> listData = state.listNews;
                return ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return CardNews(dataNews:listData[index]);
                    },
                    separatorBuilder: (BuildContext context, index) {
                      return Divider();
                    },
                    itemCount: listData.length);
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
