// Method to create a page with an image
import 'package:ecommerce_task/utill/header.dart';

Widget buildPage(String imageUrl) {
  return Container(
    padding: EdgeInsets.all(16),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    ),
  );
}