class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.id,
    this.isExpanded = true,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
  int id;
}