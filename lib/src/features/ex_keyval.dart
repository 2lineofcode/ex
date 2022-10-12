///   created               : Aditya Pratama
///   originalFilename      : _key_val
///   date                  : 20 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   general object Key Value. use example:
///   - bottom sheet dialog
///   - list dialog
///   - etc.
///
class ExKeyValue {
  ExKeyValue({
    required this.key,
    required this.value,
    this.icon,
    this.badge,
    this.isSelected,
  });

  dynamic key;
  String value;
  String? icon;
  bool? badge;
  bool? isSelected;
}
