import 'package:flutter/material.dart';

class DetailsLoading extends StatelessWidget {
  const DetailsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 64,
      height: 64,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
