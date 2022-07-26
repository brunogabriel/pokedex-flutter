import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final String name;
  final String number;
  final String thumbnail;
  final VoidCallback? onTap;

  const PokemonCard({
    Key? key,
    required this.name,
    required this.number,
    required this.thumbnail,
    this.onTap,
  }) : super(key: key);

  Widget _buildThumbnail(BuildContext context, String thumbnail) {
    const imageRadius = Radius.circular(8.0);
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: imageRadius, bottomLeft: imageRadius),
      child: SizedBox(
        width: MediaQuery.of(context).size.height * 0.25,
        child: Image.network(
          thumbnail,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(8.0);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: InkWell(
        customBorder: RoundedRectangleBorder(borderRadius: borderRadius),
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildThumbnail(context, thumbnail),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'name',
                      style: textTheme.bodySmall,
                    ),
                    Text(
                      name,
                      style: textTheme.headline5
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'number',
                      style: textTheme.bodySmall,
                    ),
                    Text(
                      number.padLeft(3, '0'),
                      style: textTheme.headline5
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
