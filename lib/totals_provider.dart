import 'package:flutter/material.dart';

class TotalsProvider extends ChangeNotifier {
  int _total_followers = 0;
  int _total_posts = 0;

  int get total_followers => _total_followers;
  int get total_posts => _total_posts;

  void increment_total_followers() {
    _total_followers++;
    notifyListeners();
  }

  void increment_total_posts() {
    _total_posts++;
    notifyListeners();
  }
}