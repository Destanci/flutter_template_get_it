import 'package:flutter/material.dart';

import '../../../models/sample_model.dart';

class SampleListController with ChangeNotifier {
  List<SampleModel> _list = [
    const SampleModel(1),
    const SampleModel(2),
    const SampleModel(3),
    const SampleModel(4),
    const SampleModel(5),
    const SampleModel(6),
    const SampleModel(7),
    const SampleModel(8),
    const SampleModel(9),
    const SampleModel(10),
    const SampleModel(11),
    const SampleModel(12),
    const SampleModel(13),
    const SampleModel(14),
    const SampleModel(15),
  ];

  List<SampleModel> get list => _list;
  set list(List<SampleModel> value) {
    _list = value;
    notifyListeners();
  }

  int addIndex = 16;
  void add(SampleModel item) {
    _list.add(item);
    notifyListeners();
  }

  void addAll(Iterable<SampleModel> items) {
    _list.addAll(items);
    notifyListeners();
  }

  void remove(SampleModel item) {
    _list.remove(item);
    notifyListeners();
  }

  void removeWhere(bool Function(SampleModel) test) {
    _list.removeWhere(test);
    notifyListeners();
  }
}
