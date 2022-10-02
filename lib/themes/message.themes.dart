import 'package:flutter/material.dart';

import 'package:star_wars/models/models.dart';
import 'package:star_wars/screens/message_error.screen.dart';

class MessageTheme {
  static buildMessage({
    required BuildContext context,
    required VoidCallback buttonNavigator,
    required VoidCallback willPopScopeNavigator,
  }) {
    final MessageModel message = MessageModel(
      buttonNavigator: buttonNavigator,
      willPopScopeNavigator: willPopScopeNavigator,
    );

    Navigator.pushNamed(
      context,
      MessageErrorScreen.routeName,
      arguments: message,
    );
  }
}
