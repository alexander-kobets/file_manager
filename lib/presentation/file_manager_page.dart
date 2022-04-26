import 'package:flutter/material.dart';
import 'package:custom_file_manager/models/file_item.dart';
import 'package:custom_file_manager/presentation/file_tile.dart';
import 'package:custom_file_manager/presentation/file_item_mocks.dart';
import 'package:custom_file_manager/presentation/widgets/add_file_floating_button.dart';
import 'package:custom_file_manager/enums/item_type_enum.dart';

const String yourItemsLabel = 'Your Items';

class FileManagerPage extends StatefulWidget {
  final String folderName;

  const FileManagerPage({
    Key? key,
    this.folderName = yourItemsLabel,
  }) : super(key: key);

  @override
  State<FileManagerPage> createState() => _FileManagerPageState();
}

class _FileManagerPageState extends State<FileManagerPage> {
  final List<FileItem> items = [];

  @override
  void initState() {
    widget.folderName == yourItemsLabel
        ? items.addAll(createItemsMock())
        : items.addAll(createFolderItemsMock());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: AddFileFloatingButton(
        onPressed: () {
          setState(() {
            items.add(
              FileItem(
                fileName: 'New file',
                authorName: 'Me',
                creationDate: DateTime.now(),
              ),
            );
          });
        },
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: 60,
                    child: OutlinedButton(
                      onPressed: () async {
                        setState(() {
                          Future.delayed(Duration.zero, () {
                            items.replaceRange(
                              0,
                              items.length,
                              items.reversed,
                            );
                          });
                        });
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.filter, size: 28),
                          SizedBox(width: 8),
                          Text('Sort'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: 'Search...',
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            itemCount: items.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return FileTile(
                fileItem: items[index],
                itemType: items[index].itemType,
                onDelete: () {
                  if (items[index].itemType == ItemType.file) {
                    setState(() {
                      items.removeAt(index);
                    });
                    Navigator.of(context).pop();
                  }
                },
                onEdit: () {
                  if (items[index].itemType == ItemType.file) {
                    setState(() {
                      items.add(items[index].copyWith(
                        fileName: 'EditedFileName',
                        creationDate: DateTime.now(),
                      ));
                      items.removeAt(index);
                    });
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: _buildLeading(),
      title: Text(
        widget.folderName,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [_buildTrailing()],
    );
  }

  Widget _buildLeading() {
    return widget.folderName != yourItemsLabel
        ? IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        : const SizedBox.shrink();
  }

  Widget _buildTrailing() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.more_horiz),
    );
  }
}
