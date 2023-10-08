class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.id,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
  int id;
}