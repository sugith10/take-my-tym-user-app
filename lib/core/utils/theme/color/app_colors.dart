import 'package:flutter/material.dart';

part 'dark_mode_color.dart';

/// Interface for defining colors used in the application's UI.
interface class AppColor {
  final Color background; // Background color.
  final Color softBackground; // Soft background color.
  final Color secondaryBackground; // Secondary background color.
  final Color lightBackground; // Light background color.
  final Color pure; // Pure color.
  final Color primaryText; // Primary text color.
  final Color primaryTextSoft; // Soft primary text color.
  final Color primaryTextBlur; // Blurred primary text color.
  final Color secondaryText; // Secondary text color.
  final Color buttonBackground; // Button background color.
  final Color buttonForground; // Button foreground color.
  final Color bottomBar; // Bottom bar background color.
  final Color iconColor; // Icon color.
  final Color gradientPrimary; // Primary gradient color.
  final Color gradientSecondary; // Secondary gradient color.
  final Color boxShadow; // Box shadow color.
  final Color primaryBorder; // Primary border color.
  final Color primarySoftBorder; // Soft primary border color.
  final Color secondaryBorder; // Secondary border color.
  final Color progressIndicatorColor; // Progress indicator color.
  final Color glassEffect; // Glass effect color.
  final Color danger; // Red color.
  final Color success; // Green color.
  final Color fillColor; // Textfield fill color.
  final Color userChatColor; // User chat color.
  final Color recipientChatColor; // Recipient chat color.
  final Color bottomSheet; // Bottom sheet background color.

  /// Constructs an [AppColor] instance with specified colors.
  AppColor({
    required this.background,
    required this.softBackground,
    required this.secondaryBackground,
    required this.lightBackground,
    required this.pure,
    required this.primaryText,
    required this.primaryTextSoft,
    required this.primaryTextBlur,
    required this.secondaryText,
    required this.buttonBackground,
    required this.buttonForground,
    required this.bottomBar,
    required this.iconColor,
    required this.gradientPrimary,
    required this.gradientSecondary,
    required this.boxShadow,
    required this.primaryBorder,
    required this.primarySoftBorder,
    required this.secondaryBorder,
    required this.progressIndicatorColor,
    required this.glassEffect,
    required this.danger,
    required this.fillColor,
    required this.userChatColor,
    required this.recipientChatColor,
    required this.success,
    required this.bottomSheet,
  });
}
