import 'package:flutter/material.dart';

import '../../domain/entities/location_search_entity.dart';

class FavoriteButtonWidget extends StatefulWidget {
  final LocationSearch entity;
  final Function(LocationSearch entity) onClickButton;

  const FavoriteButtonWidget({
    Key? key,
    required this.entity,
    required this.onClickButton,
  }) : super(key: key);

  @override
  _FavoriteButtonWidgetState createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        widget.onClickButton(widget.entity);
      },
      icon: widget.entity.isFavorite
          ? const Icon(Icons.star)
          : const Icon(Icons.star_border),
      color: Theme.of(context).indicatorColor,
    );
  }
}
