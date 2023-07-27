class Ability {
  Ability({
    required this.name,
    required this.url,
    required this.slot,
    required this.isHidden,
  });

  final String name;
  final String url;
  final int slot;
  final bool isHidden;
}
