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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => ListFavoritePage())),
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

                return SingleChildScrollView(
                  child: ResponsiveGridRow(
                    children: listData
                        .asMap()
                        .keys
                        .toList()
                        .map(
                          (e) => ResponsiveGridCol(
                            lg: e == 0 ? 12 : null,
                            xs: e != 0 ? 6 : 12,
                            md: e != 0 ? 3 : null,
                            child: CardNews(
                              dataNews: listData[e],
                              index: e,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );
                // return ListView.separated(
                //     itemBuilder: (BuildContext context, int index) {
                //       return ResponsiveGridRow(children: [
                //         ResponsiveGridCol(
                //           lg: index == 0 ? 12 : null,
                //           xs: index != 0 ? 6 : 12,
                //           md: index != 0 ? 3 : 12,
                //           child: CardNews(dataNews: listData[index]),
                //         ),
                //       ]);
                //       // return CardNews(dataNews:listData[index]);
                //     },
                //     separatorBuilder: (BuildContext context, index) {
                //       return Container();
                //     },
                // itemCount: listData.length);
              } else if (state is ListNewsError) {
                return Text(state.msg);
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
