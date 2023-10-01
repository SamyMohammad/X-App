import 'package:hive/hive.dart';

part 'language_cm.g.dart';

@HiveType(typeId: 4)
enum LanguageCM {
  @HiveField(0)
  arabic,
  @HiveField(1)
  english,
}
