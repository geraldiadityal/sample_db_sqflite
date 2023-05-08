part of 'pages.dart';

class ListFavoritePage extends StatelessWidget {
  const ListFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
            width: size.width,
            height: size.height,
            color: Colors.white,
            child: FutureBuilder(
                future: LocalDatabase.getFavorite(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // return Text("Data nya ada");
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, int index) {
                          return Dismissible(
                              direction: DismissDirection.horizontal,
                              secondaryBackground: Container(
                                color: secondaryColor,
                                child: Align(
                                  child: Text("delete favorite"),
                                  alignment: Alignment.centerRight,
                                ),
                              ),
                              background: Container(
                                color: primaryColor,
                                child: Align(
                                  child: Text(
                                    "delete by id",
                                    style: TextStyle(color: accentWhite),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
                              confirmDismiss: (direction) async {
                                String? msg;
                                switch (direction) {
                                  case DismissDirection.endToStart:
                                    await LocalDatabase.deleteFavorite(
                                        snapshot.data![index]);
                                    msg = "Remove with Favorite data";
                                    break;
                                  case DismissDirection.startToEnd:
                                    await LocalDatabase.deleteFavoriteById(
                                        snapshot.data![index].id!);
                                    msg = "Remove with ID data";
                                    break;
                                  default:
                                    break;
                                }
                                if (msg != null) {
                                  final scaffoldState =
                                      ScaffoldMessenger.of(context);
                                  scaffoldState.hideCurrentSnackBar();
                                  scaffoldState.showSnackBar(
                                    SnackBar(
                                      content: Text(msg),
                                    ),
                                  );
                                }
                                return msg != null;
                              },
                              key: ValueKey<int>(snapshot.data![index].id!),
                              child: Card(
                                child: ListTile(
                                  title: Text(snapshot.data![index].judul),
                                ),
                              ));
                        });
                  } else {
                    return Center(
                      child: Text("Data favorite kosong"),
                    );
                  }
                })),
      ),
    );
  }
}
