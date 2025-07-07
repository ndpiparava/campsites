import 'package:flutter/material.dart';
import 'package:flutter_campsite_app/widgets/organisms/campsite_filter_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/campsite_provider.dart';
import '../widgets/organisms/campsite_card.dart';

class HomeView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredCampsites = ref.watch(filteredCampsiteListProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Campsites')),
      body: filteredCampsites.isEmpty
          ? Center(child: Text('No campsites match the filter criteria'))
          : ListView.builder(
              itemCount: filteredCampsites.length,
              itemBuilder: (context, index) =>
                  CampsiteCard(campsite: filteredCampsites[index]),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showFilterDialog(context, ref),
        child: Icon(Icons.filter_list),
      ),
    );
  }

  void _showFilterDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return FilterDialog();
      },
    );
  }
}
