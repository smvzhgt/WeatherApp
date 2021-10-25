import 'package:flutter/material.dart';

import '../../../location/presentation/pages/location_page.dart';
import '../../domain/entities/location_search_entity.dart';

class LocationSearchRowItem extends StatelessWidget {
  final LocationSearch entity;

  const LocationSearchRowItem({
    Key? key,
    required this.entity,
  }) : super(key: key);

  void _onTouch(BuildContext context) {
    Navigator.pushNamed(context, LocationPage.routeName, arguments: entity);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(entity.title),
        onTap: () => _onTouch(context),
        trailing: GestureDetector(
          child: const Icon(Icons.star_border),
        ),
      ),
    );
  }
}
