import 'package:flutter/material.dart';
import 'package:tithe_tracker/core/models/tithe.dart';
import 'package:tithe_tracker/core/repository/tithe_repository.dart';

class TitheVM extends ChangeNotifier {
  List<TitheModel> _titheList = [];

  List<TitheModel> get titheList => _titheList;

  set loadTitheList(List<TitheModel> val) {
    _titheList = val;
    notifyListeners();
  }

  void initialize() async {
    List<TitheModel> titheList = await TitheRepository.getTitheList();
    loadTitheList = titheList;
  }

  void updateList(String month) {
    List<TitheModel> updatedList = TitheRepository().updateTitheList(
      _titheList,
      month,
    );
    _titheList = updatedList;
    notifyListeners();
  }
}
