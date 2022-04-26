import 'package:custom_file_manager/enums/button_option_enum.dart';
import 'package:custom_file_manager/models/file_item.dart';
import 'package:custom_file_manager/presentation/widgets/option_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_file_manager/enums/item_type_enum.dart';
import 'package:custom_file_manager/presentation/file_manager_page.dart';
import 'package:intl/intl.dart';

class FileTile extends StatelessWidget {
  final ItemType itemType;
  final FileItem fileItem;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const FileTile({
    Key? key,
    required this.fileItem,
    required this.onDelete,
    required this.onEdit,
    this.itemType = ItemType.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (itemType == ItemType.folder) {
          Navigator.of(context).push(
            CupertinoPageRoute(builder: (context) {
              return FileManagerPage(
                folderName: fileItem.fileName,
              );
            }),
          );
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 12,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: itemType.icon,
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(fileItem.fileName),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            '${fileItem.authorName} •',
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            DateFormat('dd.MM.yyyy HH:mm')
                                .format(fileItem.creationDate),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: () {
                  _onOptionsPressed(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onOptionsPressed(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OptionTile(
              buttonOption: ButtonOption.edit,
              onPressed: onEdit,
            ),
            OptionTile(
              buttonOption: ButtonOption.download,
              onPressed: () {},
            ),
            OptionTile(
              buttonOption: ButtonOption.delete,
              onPressed: onDelete,
            ),
          ],
        );
      },
    );
  }
}
