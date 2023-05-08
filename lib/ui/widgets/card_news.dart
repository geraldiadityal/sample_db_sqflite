part of 'widgets.dart';

class CardNews extends StatelessWidget {
  final News dataNews;
  final int? index;
  const CardNews({super.key, required this.dataNews, this.index = 0});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Get.to(DetailPage(
          link: dataNews.link!,
        ));
      },
      child: Container(
        alignment: Alignment(0, 0),
        height: 150,
        decoration: BoxDecoration(
          color: index == 0
              ? primaryColor
              : index! % 2 == 0
                  ? secondaryColor
                  : accentColor1,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          dataNews.judul!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: accentWhite),
        ),
      ),
    );
  }
}
