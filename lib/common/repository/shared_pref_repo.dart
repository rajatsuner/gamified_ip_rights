import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefRepositoryProvider =
    Provider((ref) => SharedPreferenceRepository());

class SharedPreferenceRepository {
  late SharedPreferences _prefs;

  // //Total Amount
  // Future<double> getTotalAmount() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   if (_prefs.containsKey(SharedPrefConst.totalAmount)) {
  //     return _prefs.getDouble(SharedPrefConst.totalAmount) ?? 100;
  //   }
  //   await setTotalAmount(100);
  //   return 100;
  // }

  // Future<bool> setTotalAmount(double amount) async {
  //   _prefs = await SharedPreferences.getInstance();
  //   await _prefs.setDouble(SharedPrefConst.totalAmount, amount);
  //   return true;
  // }

  // //Stats
  // Future<int> getCorrectAnswers() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   if (_prefs.containsKey(SharedPrefConst.correctAnswers)) {
  //     return _prefs.getInt(SharedPrefConst.correctAnswers) ?? 0;
  //   }
  //   await setCorrectAnswers(0);
  //   return 0;
  // }

  // Future<bool> setCorrectAnswers(int value) async {
  //   _prefs = await SharedPreferences.getInstance();
  //   await _prefs.setInt(SharedPrefConst.correctAnswers, value);
  //   return true;
  // }

  // Future<int> getWrongAnswers() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   if (_prefs.containsKey(SharedPrefConst.wrongAnswers)) {
  //     return _prefs.getInt(SharedPrefConst.wrongAnswers) ?? 0;
  //   }
  //   await setWrongAnswers(0);
  //   return 0;
  // }

  // Future<bool> setWrongAnswers(int value) async {
  //   _prefs = await SharedPreferences.getInstance();
  //   await _prefs.setInt(SharedPrefConst.wrongAnswers, value);
  //   return true;
  // }

  // Future<int> getGamesPlayed() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   if (_prefs.containsKey(SharedPrefConst.gamesPlayed)) {
  //     return _prefs.getInt(SharedPrefConst.gamesPlayed) ?? 0;
  //   }
  //   await setGamesPlayed(0);
  //   return 0;
  // }

  // Future<bool> setGamesPlayed(int value) async {
  //   _prefs = await SharedPreferences.getInstance();
  //   await _prefs.setInt(SharedPrefConst.gamesPlayed, value);
  //   return true;
  // }

  // Future<int> getGamesWon() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   if (_prefs.containsKey(SharedPrefConst.gamesWon)) {
  //     return _prefs.getInt(SharedPrefConst.gamesWon) ?? 0;
  //   }
  //   await setCorrectAnswers(0);
  //   return 0;
  // }

  // Future<bool> setGamesWon(int value) async {
  //   _prefs = await SharedPreferences.getInstance();
  //   await _prefs.setInt(SharedPrefConst.gamesWon, value);
  //   return true;
  // }
}
