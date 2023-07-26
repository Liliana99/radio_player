import '../../../domain/models/item_model.dart';

List<ContentItem> convertToContentItemList(Map<String, dynamic> items) =>
    items.entries.map((entry) {
      return ContentItem.fromMap(Map<String, dynamic>.from(entry.value));
    }).toList();
