import 'package:custom_file_manager/enums/item_type_enum.dart';
import 'package:custom_file_manager/models/file_item.dart';

List<FileItem> createItemsMock() {
  return [
    FileItem(
      fileName: 'FolderName1',
      authorName: 'Me',
      creationDate: DateTime(2022, 4, 4, 11, 29),
      itemType: ItemType.folder,
    ),
    FileItem(
      fileName: 'Name3',
      authorName: 'Author2',
      creationDate: DateTime(2021, 12, 11, 18, 18),
    ),
    FileItem(
      fileName: 'Name1',
      authorName: 'Author2',
      creationDate: DateTime(2021, 12, 12, 16, 17),
    ),
    FileItem(
      fileName: 'Name1',
      authorName: 'Author1',
      creationDate: DateTime(2022, 1, 2, 01, 15),
    ),
  ];
}

List<FileItem> createFolderItemsMock() {
  return [
    FileItem(
      fileName: 'AnotherName1',
      authorName: 'Author11',
      creationDate: DateTime(2022, 1, 2, 01, 15),
    ),
    FileItem(
      fileName: '2342141',
      authorName: 'Author2',
      creationDate: DateTime(2021, 12, 12, 16, 17),
    ),
    FileItem(
      fileName: 'Name3',
      authorName: 'Author',
      creationDate: DateTime(2021, 12, 11, 18, 18),
    )
  ];
}
