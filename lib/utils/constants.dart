import 'package:flutter_campsite_app/widgets/molecules/radio_group.dart';

final Map<String, String> allLanguages = {
  'en': 'English',
  'fr': 'French',
  'de': 'German',
  'es': 'Spanish',
};

const List<RadioOption<bool?>> defaultCampfireOptions = [
  RadioOption(value: null, label: 'Any'),
  RadioOption(value: true, label: 'Yes'),
  RadioOption(value: false, label: 'No'),
];
