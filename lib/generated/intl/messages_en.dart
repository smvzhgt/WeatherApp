// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "error_loading_weather_data":
            MessageLookupByLibrary.simpleMessage("Error loading weather data"),
        "error_message_no_view_state":
            MessageLookupByLibrary.simpleMessage("No view for state:"),
        "hint_text_input_location_search":
            MessageLookupByLibrary.simpleMessage("Input location name"),
        "message_information_page":
            MessageLookupByLibrary.simpleMessage("Empty result found"),
        "page_title_forecast":
            MessageLookupByLibrary.simpleMessage("Forecast Page"),
        "page_title_location_search":
            MessageLookupByLibrary.simpleMessage("Location Search"),
        "suffix_path_humidity": MessageLookupByLibrary.simpleMessage("%"),
        "suffix_path_visibility": MessageLookupByLibrary.simpleMessage("miles"),
        "suffix_pressure": MessageLookupByLibrary.simpleMessage("mb"),
        "suffix_wind_speed": MessageLookupByLibrary.simpleMessage("mph"),
        "temperature_max": MessageLookupByLibrary.simpleMessage("Max:"),
        "temperature_min": MessageLookupByLibrary.simpleMessage("Min:")
      };
}
