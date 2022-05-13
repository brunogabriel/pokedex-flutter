import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  final String title, content, thumbnail;

  const OnboardingWidget({
    super.key,
    required this.title,
    required this.content,
    required this.thumbnail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          thumbnail,
          height: 250,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          content,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.caption,
        ),
        const Spacer(),
      ],
    );
  }
}
