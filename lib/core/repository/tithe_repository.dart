import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tithe_tracker/core/data/tithe_initial_state.dart';
import 'package:tithe_tracker/core/models/tithe.dart';

class TitheRepository {
  static Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  static Future saveTitheList(List<TitheModel> list) async {
    final SharedPreferences prefs = await _prefs;
    List<String> titheList =
        list.map((item) => jsonEncode(item.toMap())).toList();
    prefs.setStringList("tithes", titheList);
  }

  static Future<List<TitheModel>> getTitheList() async {
    final SharedPreferences prefs = await _prefs;
    List<String>? list = prefs.getStringList("tithes");

    final List<TitheModel> titheList = list != null && list.isNotEmpty
        ? list.map((item) => TitheModel.fromMap(jsonDecode(item))).toList()
        : initialTitheList;

    return titheList;
  }

  List<TitheModel> updateTitheList(List<TitheModel> titheList, String month) {
    List<TitheModel> updatedList = titheList.map((tithe) {
      return TitheModel(
        month: tithe.month,
        isPaid: tithe.month == month ? !tithe.isPaid : tithe.isPaid,
      );
    }).toList();

    saveTitheList(updatedList);
    return updatedList;
  }
}
