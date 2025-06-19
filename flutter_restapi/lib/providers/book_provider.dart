import 'package:flutter/material.dart';
import 'package:flutter_restapi/models/book_model.dart';
import 'package:flutter_restapi/services/book_service.dart';

class BookProvider with ChangeNotifier {
  List<BookModel> _book = [];
  List<BookModel> get book => _book;

  set book(List<BookModel> data) {
    _book = data;
    notifyListeners();
  }

  bool _isLoading = true;
  bool get IsLoading => _isLoading;

  set isLoading(bool data) {
    _isLoading = data;
    notifyListeners();
  }

  Future<void> getBook() async {
    _isLoading = true;
    await BookService().getBook().then((value) {
      _isLoading = false;
      _book = value;
    }).catchError((err) {
      throw Exception('Failed');
    });
  }
}
