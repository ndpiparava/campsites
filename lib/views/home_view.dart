import 'package:flutter/material.dart';
import 'package:flutter_campsite_app/views/map_view.dart';
import 'package:flutter_campsite_app/widgets/organisms/campsite_filter_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/campsite_provider.dart';
import '../widgets/organisms/campsite_card.dart';

class HomeView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredCampsites = ref.watch(filteredCampsiteListProvider);
    void _openMapView(BuildContext context, WidgetRef ref) {
      final filteredCampsites = ref.read(filteredCampsiteListProvider);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MapView(campsites: filteredCampsites),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Campsites'),
        actions: [
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () => _openMapView(context, ref),
          ),
        ],
      ),
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
