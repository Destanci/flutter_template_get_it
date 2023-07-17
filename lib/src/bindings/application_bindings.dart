import 'package:get_it/get_it.dart';

import '../../app.dart';
import '../../widgets/pages/sample_details/sample_details_controller.dart';
import '../../widgets/pages/sample_list/sample_list_controller.dart';

class ApplicationBindings {
  static initLocator() {
    // * Widget Bindings

    GetIt.I.registerSingleton(MyApp());

    // * Controller Bindings

    GetIt.I.registerLazySingleton(
      () => SampleListController(),
      dispose: (param) => param.dispose(),
    );
    GetIt.I.registerLazySingleton(
      () => SampleDetailController(),
      dispose: (param) => param.dispose(),
    );
  }
}
