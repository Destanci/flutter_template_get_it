import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:template_first/widgets/pages/sample_details/sample_details_controller.dart';

import '../../../src/utils/localization.dart';

class SampleItemDetailsView extends StatelessWidget {
  static const routeName = '/sample_item';

  SampleItemDetailsView({super.key});

  final SampleDetailController controller = GetIt.I.get();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(Localization.of(context).itemDetails),
          ),
          body: controller.hasData
              ? Center(
                  child: Text('DATA (${controller.model!.id})'),
                )
              : child,
        );
      },
      child: Center(
        child: Text(Localization.of(context).moreInformationHere),
      ),
    );
  }
}
