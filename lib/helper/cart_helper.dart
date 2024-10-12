import 'dart:convert';

import 'package:ecommerce_task/utill/app_constants.dart';
import 'package:http/http.dart' as http;
  class CartHelper{
  // Function to fetch products from API
   static Future<List<dynamic>> fetchProducts() async {
     http.Response response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
     var data = jsonDecode(response.body);
     print("datas${data}");
      if (response.statusCode == 200) {
        return data; // Return the body of the response
      } else {
        throw Exception('Failed to load posts');
      }
    }
}