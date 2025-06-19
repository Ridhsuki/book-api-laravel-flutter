import 'dart:convert';

import 'package:flutter_restapi/models/book_model.dart';
import 'package:http/http.dart' as http;

class BookService {
  Future<List<BookModel>> getBook() async {
    var url = 'http://127.0.0.1:8000/api/book/';
    var headers = {'Accept': 'application/json'};
    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<BookModel> model = [];

      for (var item in data) {
        model.add(BookModel.fromJson(item));
      }

      return model;
    } else {
      throw Exception('Failed');
    }
  }
}
