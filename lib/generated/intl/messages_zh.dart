// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "annual_fee": MessageLookupByLibrary.simpleMessage("年付"),
        "day": MessageLookupByLibrary.simpleMessage("天"),
        "mobthpay": MessageLookupByLibrary.simpleMessage("月付"),
        "permanent": MessageLookupByLibrary.simpleMessage("永久"),
        "quarterly_payment": MessageLookupByLibrary.simpleMessage("季付"),
        "semi_annual_payment": MessageLookupByLibrary.simpleMessage("半年付"),
        "ss1": MessageLookupByLibrary.simpleMessage("123"),
        "weekpay": MessageLookupByLibrary.simpleMessage("周付")
      };
}
