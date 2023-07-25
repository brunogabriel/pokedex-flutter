import 'package:flutter/material.dart';

class PokemonsLoading extends StatelessWidget {
  const PokemonsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement this one

    return Center(
      child: Container(
        width: 32,
        height: 32,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
