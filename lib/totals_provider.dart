import 'package:flutter/material.dart';

class TotalsProvider extends ChangeNotifier {
  int _fares_posts = 0;
  int _fares_followers = 0;
  int _fares_following = 0;

  int _youssef_posts = 0;
  int _youssef_followers = 0;
  int _youssef_following = 0;

  int _barbary_posts = 0;
  int _barbary_followers = 0;
  int _barbary_following = 0;

  int get fares_posts => _fares_posts;
  int get fares_followers => _fares_followers;
  int get fares_following => _fares_following;

  int get youssef_posts => _youssef_posts;
  int get youssef_followers => _youssef_followers;
  int get youssef_following => _youssef_following;

  int get barbary_posts => _barbary_posts;
  int get barbary_followers => _barbary_followers;
  int get barbary_following => _barbary_following;

  int get total_followers => _fares_followers + _youssef_followers + _barbary_followers;
  int get total_posts => _fares_posts + _youssef_posts + _barbary_posts;

  void increment_fares_followers() {
    _fares_followers++;
    notifyListeners();
  }

  void increment_fares_posts() {
    _fares_posts++;
    notifyListeners();
  }

  void increment_fares_following() {
    _fares_following++;
    notifyListeners();
  }

  void increment_youssef_followers() {
    _youssef_followers++;
    notifyListeners();
  }

  void increment_youssef_posts() {
    _youssef_posts++;
    notifyListeners();
  }

  void increment_youssef_following() {
    _youssef_following++;
    notifyListeners();
  }

  void increment_barbary_followers() {
    _barbary_followers++;
    notifyListeners();
  }

  void increment_barbary_posts() {
    _barbary_posts++;
    notifyListeners();
  }

  void increment_barbary_following() {
    _barbary_following++;
    notifyListeners();
  }

  void increment_total_followers() {
    _fares_followers++;
    notifyListeners();
  }

  void increment_total_posts() {
    _fares_posts++;
    notifyListeners();
  }
}
