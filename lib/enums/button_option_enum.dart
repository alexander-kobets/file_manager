import 'package:flutter/material.dart';

enum ButtonOption {
  delete,
  edit,
  download,
}

extension ButtonVisuals on ButtonOption {
  Icon get icon {
    switch (this) {
      case ButtonOption.delete:
        return const Icon(Icons.delete);
      case ButtonOption.edit:
        return const Icon(Icons.edit);
      case ButtonOption.download:
        return const Icon(Icons.download);
    }
  }

  String get label {
    switch (this) {
      case ButtonOption.delete:
        return 'Delete';
      case ButtonOption.edit:
        return 'Edit';
      case ButtonOption.download:
        return 'Download';
    }
  }
}
