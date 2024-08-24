part of '../taxt_manipulator.dart';

final class _AggressiveTrim{
    static String aggressiveTrim(String input) {
    if (input.isEmpty) return "";

    String text = "";
    text += input[0].toUpperCase();
    if (input.length == 1) return text;

    text += input.substring(1).toLowerCase();
    return text.replaceAll(RegExp(r'\s+'), '');
  }
}