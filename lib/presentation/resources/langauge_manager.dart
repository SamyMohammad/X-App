import 'package:flutter/material.dart';
import 'package:x_app/data/local/data_sources/models/language_cm.dart';


const String ARABIC = "ar";
const String ENGLISH = "en";
const String ASSET_PATH_LOCALISATIONS = "assets/translations";
const Locale ARABIC_LOCAL = Locale("ar", "SA");
const Locale ENGLISH_LOCAL = Locale("en", "US");

extension LanguageTypeExtension on LanguageCM {
  String getValue() {
    switch (this) {
      case LanguageCM.arabic:
        return ARABIC;
      case LanguageCM.english:
        return ENGLISH;
    }
  }
}
