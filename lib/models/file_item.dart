import 'package:custom_file_manager/enums/item_type_enum.dart';

class FileItem {
  final String fileName;
  final String authorName;
  final DateTime creationDate;
  final ItemType itemType;

  FileItem({
    required this.fileName,
    required this.authorName,
    required this.creationDate,
    this.itemType = ItemType.file,
  });

  FileItem copyWith({
    String? fileName,
    String? authorName,
    DateTime? creationDate,
  }) {
    return FileItem(
      fileName: fileName ?? this.fileName,
      authorName: authorName ?? this.authorName,
      creationDate: creationDate ?? this.creationDate,
    );
  }
}
