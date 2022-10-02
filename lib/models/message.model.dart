import 'package:flutter/material.dart';

class MessageModel {
  final VoidCallback buttonNavigator;
  final VoidCallback willPopScopeNavigator;

  MessageModel({
    required this.buttonNavigator,
    required this.willPopScopeNavigator,
  });
}
