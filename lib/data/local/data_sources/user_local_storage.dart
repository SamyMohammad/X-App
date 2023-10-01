// import 'package:x_app/app/key_value_storage.dart';
// import 'package:x_app/data/local/data_sources/models/dark_mode_preference_cm.dart';
// import 'package:x_app/data/local/data_sources/models/language_cm.dart';
//
//
// class UserLocalStorage {
//   UserLocalStorage({
//     required this.noSqlStorage,
//   });
//
//   final KeyValueStorage noSqlStorage;
//
//   Future<void> upsertDarkModePreference(DarkModePreferenceCM preference) async {
//     final box = await noSqlStorage.darkModePreferenceBox;
//     await box.put(0, preference);
//   }
//
//   Future<DarkModePreferenceCM?> getDarkModePreference() async {
//     final box = await noSqlStorage.darkModePreferenceBox;
//     return box.get(0);
//   }
//
//   Future<void> upsertLanguage(LanguageCM preference) async {
//     final box = await noSqlStorage.languageBox;
//     await box.put(0, preference);
//   }
//
//   Future<LanguageCM?> getLanguage() async {
//     final box = await noSqlStorage.languageBox;
//     return box.get(0);
//   }
// }
