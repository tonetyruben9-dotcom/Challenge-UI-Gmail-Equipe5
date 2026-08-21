import 'package:flutter/material.dart';

class Mail {
  const Mail({
    required this.sender,
    required this.subject,
    required this.preview,
    required this.date,
    required this.avatarColor,
    this.body = '',
    this.isRead = false,
  });

  final String sender;
  final String subject;
  final String preview;
  final String date;
  final Color avatarColor;
  final String body;
  final bool isRead;

  String get initials {
    final names = sender.trim().split(RegExp(r'\s+'));
    if (names.length == 1) return names.first.substring(0, 1).toUpperCase();
    return '${names.first[0]}${names.last[0]}'.toUpperCase();
  }
}