part of 'widgets.dart';

class CardNews extends StatelessWidget {
  final News dataNews;
  const CardNews({super.key, required this.dataNews});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Get.to(DetailPage(
          link: dataNews.link,
        ));
      },
      child: Container(
        width: size.width,
        height: 150,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          dataNews.judul,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: accentWhite),
        ),
      ),
    );
  }
}
