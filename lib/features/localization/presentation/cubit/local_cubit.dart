import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'local_states.dart';

class LocalCubit extends Cubit<LocalStates> {
  String currentLanguageCode;

  LocalCubit({required this.currentLanguageCode}) : super(LocaleInitial());

  void changeLanguage({
    required BuildContext context,
    required String newLanguageCode,
  }) {
    if (currentLanguageCode == newLanguageCode) return;
    currentLanguageCode = newLanguageCode;
    context.setLocale(Locale(newLanguageCode));
    emit(ChangeLocaleState());
  }

  bool isSelectedLanguage({required String languageCode}) {
    return languageCode == currentLanguageCode;
  }
}
