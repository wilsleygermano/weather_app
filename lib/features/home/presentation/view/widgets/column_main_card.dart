import 'package:flutter/material.dart';

class ColumnMainCard extends StatelessWidget {
  final String valueName;
  final num value;
  final String valueUnit;
  const ColumnMainCard({
    Key? key,
    required this.valueName,
    required this.value,
    required this.valueUnit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          valueName,
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          value.toString() + valueUnit,
          style: Theme.of(context).textTheme.headline6,
        )
      ],
    );
  }
}
