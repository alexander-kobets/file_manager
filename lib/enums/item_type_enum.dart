import 'package:flutter/material.dart';

enum ItemType {
  folder,
  file,
}

extension ItemTypeIcon on ItemType {
  Icon get icon {
    switch (this) {
      case ItemType.file:
        return const Icon(
          Icons.file_open,
          color: Colors.blueAccent,
        );
      case ItemType.folder:
        return const Icon(
          Icons.folder,
          color: Colors.blueAccent,
        );
    }
  }
}
