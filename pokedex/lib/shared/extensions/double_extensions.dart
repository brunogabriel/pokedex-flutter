extension DoubleExtensions on double {
  String toEffectivenessFactor() {
    if (this == 0.5) {
      return '½';
    } else if (this == 0.25) {
      return '¼';
    } else if (this == 0.0) {
      return '*';
    } else {
      return toInt().toString();
    }
  }
}
