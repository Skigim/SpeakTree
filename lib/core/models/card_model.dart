import 'package:hive/hive.dart';

part 'card_model.g.dart';

/// Represents a communication card in the AAC system
/// This is a placeholder for future implementation
@HiveType(typeId: 0)
class CardModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String label;

  @HiveField(2)
  String? imagePath;

  @HiveField(3)
  String? audioPath;

  @HiveField(4)
  String text;

  @HiveField(5)
  DateTime createdAt;

  @HiveField(6)
  DateTime updatedAt;

  CardModel({
    required this.id,
    required this.label,
    required this.text,
    this.imagePath,
    this.audioPath,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'text': text,
        'imagePath': imagePath,
        'audioPath': audioPath,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'] as String,
      label: json['label'] as String,
      text: json['text'] as String,
      imagePath: json['imagePath'] as String?,
      audioPath: json['audioPath'] as String?,
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }
}
