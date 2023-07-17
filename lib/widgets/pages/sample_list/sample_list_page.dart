import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:template_first/widgets/pages/sample_details/sample_details_controller.dart';

import '../../../models/sample_model.dart';
import 'sample_list_controller.dart';
import '../settings/settings_page.dart';
import '../../../src/utils/localization.dart';
import '../sample_details/sample_details_page.dart';

class SampleListPage extends StatelessWidget {
  static const routeName = '/';

  SampleListPage({super.key});

  final SampleListController controller = GetIt.I.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Localization.of(context).sampleTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsPage.routeName);
            },
          ),
        ],
      ),
      body: ListenableBuilder(
          listenable: controller,
          builder: (context, child) {
            return ListView.builder(
              restorationId: 'sampleItemListView',
              itemCount: controller.list.length,
              itemBuilder: (BuildContext context, int index) {
                final item = controller.list[index];
                return ListTile(
                  title: Text('${Localization.of(context).sampleItem} ${item.id}'),
                  subtitle: Text(Localization.of(context).sampleItemDescription),
                  leading: const CircleAvatar(
                    foregroundImage: AssetImage('assets/images/flutter_logo.png'),
                  ),
                  onTap: () {
                    GetIt.I.get<SampleDetailController>().model = item;
                    Navigator.restorablePushNamed(
                      context,
                      SampleItemDetailsView.routeName,
                    );
                  },
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.add(SampleModel(controller.addIndex++));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
