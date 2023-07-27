import 'package:flutter/material.dart';

class AboutLoading extends StatelessWidget {
  const AboutLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement this one or use a default shared (maybe will be better)

    return Center(
      child: Container(
        width: 32,
        height: 32,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
