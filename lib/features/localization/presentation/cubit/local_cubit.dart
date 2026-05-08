import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'local_states.dart';

class LocalCubit extends Cubit<LocalStates> {
  String currentLanguageCode = 'en';

  LocalCubit() : super(LocaleInitial());

  void changeLanguage({
    required BuildContext context,
    required String newLanguageCode,
  }) {
    currentLanguageCode = newLanguageCode;
    Locale newLocale = Locale(newLanguageCode);
    context.setLocale(newLocale);
    emit(ChangeLocaleState());
  }

  bool isSelectedLanguage({required String languageCode}) {
    return languageCode == currentLanguageCode;
  }
}
