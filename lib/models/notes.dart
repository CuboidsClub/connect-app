import 'package:hive/hive.dart';

part 'notes.g.dart';

@HiveType(typeId: 0)
class Notes {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? content;
  @HiveField(3)
  String? createdDate;
  @HiveField(4)
  String? lastEditedDate;
  Notes({
    this.id,
    this.title,
    this.content,
    this.createdDate,
    this.lastEditedDate,
  });

  Notes copyWith({
    String? id,
    String? title,
    String? content,
    String? createdDate,
    String? lastEditedDate,
  }) {
    return Notes(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdDate: createdDate ?? this.createdDate,
      lastEditedDate: lastEditedDate ?? this.lastEditedDate,
    );
  }
}
