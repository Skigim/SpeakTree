import 'package:hive/hive.dart';

part 'folder_model.g.dart';

/// Represents a folder that can contain cards or other folders
/// This is a placeholder for future implementation
@HiveType(typeId: 1)
class FolderModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String? iconPath;

  @HiveField(3)
  List<String> cardIds;

  @HiveField(4)
  List<String> subfolderIds;

  @HiveField(5)
  DateTime createdAt;

  @HiveField(6)
  DateTime updatedAt;

  FolderModel({
    required this.id,
    required this.name,
    this.iconPath,
    List<String>? cardIds,
    List<String>? subfolderIds,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : cardIds = cardIds ?? [],
        subfolderIds = subfolderIds ?? [],
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'iconPath': iconPath,
        'cardIds': cardIds,
        'subfolderIds': subfolderIds,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory FolderModel.fromJson(Map<String, dynamic> json) {
    return FolderModel(
      id: json['id'] as String,
      name: json['name'] as String,
      iconPath: json['iconPath'] as String?,
      cardIds: (json['cardIds'] as List<dynamic>?)?.cast<String>(),
      subfolderIds: (json['subfolderIds'] as List<dynamic>?)?.cast<String>(),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }
}
