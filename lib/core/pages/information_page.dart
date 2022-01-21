import 'package:flutter/material.dart';
import 'package:forecastapp/core/widgets/background.dart';

class InformationPage extends StatelessWidget {
  final String message;

  const InformationPage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Center(
          child: Text(
            message,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: ThemeData.light().copyWith(primaryColor: Colors.amber).primaryColor
            ),
          ),
        )
      ],
    );
  }
}
