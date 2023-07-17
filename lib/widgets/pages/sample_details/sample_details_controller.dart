import 'package:flutter/material.dart';

import '../../../models/sample_model.dart';

class SampleDetailController with ChangeNotifier {
  SampleModel? _model;

  bool get hasData => _model != null;
  SampleModel? get model => _model;
  set model(SampleModel? value) {
    _model = value;
    notifyListeners();
  }
}
