import 'package:intl/intl.dart';

import '../configs/app_constants.dart';

/// Formatter utility class for date, time, and currency formatting
class Formatters {
  Formatters._();

  /// Format date to display format (MMM dd, yyyy)
  static String formatDate(DateTime date) {
    return DateFormat(AppConstants.displayDateFormat).format(date);
  }

  /// Format time to display format (hh:mm a)
  static String formatTime(DateTime time) {
    return DateFormat(AppConstants.displayTimeFormat).format(time);
  }

  /// Format datetime to display format (MMM dd, yyyy hh:mm a)
  static String formatDateTime(DateTime dateTime) {
    return DateFormat(AppConstants.displayDateTimeFormat).format(dateTime);
  }

  /// Format date to API format (yyyy-MM-dd)
  static String formatDateForApi(DateTime date) {
    return DateFormat(AppConstants.dateFormat).format(date);
  }

  /// Format datetime to API format (yyyy-MM-dd HH:mm:ss)
  static String formatDateTimeForApi(DateTime dateTime) {
    return DateFormat(AppConstants.dateTimeFormat).format(dateTime);
  }

  /// Parse date from API format
  static DateTime? parseDateFromApi(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      return DateFormat(AppConstants.dateFormat).parse(dateString);
    } catch (e) {
      return null;
    }
  }

  /// Parse datetime from API format
  static DateTime? parseDateTimeFromApi(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return null;
    try {
      return DateFormat(AppConstants.dateTimeFormat).parse(dateTimeString);
    } catch (e) {
      return null;
    }
  }

  /// Format currency (e.g., $12.99)
  static String formatCurrency(double amount) {
    return NumberFormat.currency(symbol: '\$', decimalDigits: 2).format(amount);
  }

  /// Format currency without symbol (e.g., 12.99)
  static String formatCurrencyWithoutSymbol(double amount) {
    return NumberFormat('0.00').format(amount);
  }

  /// Format number with commas (e.g., 1,234,567)
  static String formatNumber(int number) {
    return NumberFormat('#,###').format(number);
  }

  /// Format percentage (e.g., 10%)
  static String formatPercentage(double value) {
    return '${value.toStringAsFixed(0)}%';
  }

  /// Format phone number (e.g., (123) 456-7890)
  static String formatPhoneNumber(String phoneNumber) {
    final digitsOnly = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    if (digitsOnly.length == 10) {
      return '(${digitsOnly.substring(0, 3)}) ${digitsOnly.substring(3, 6)}-${digitsOnly.substring(6)}';
    }
    return phoneNumber;
  }

  /// Format time ago (e.g., "2 hours ago", "just now")
  static String formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    }
  }

  /// Format delivery time (e.g., "15-30 min")
  static String formatDeliveryTime() {
    return '${AppConstants.estimatedDeliveryTimeMin}-${AppConstants.estimatedDeliveryTimeMax} min';
  }

  /// Capitalize first letter
  static String capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  /// Format order status to display text
  static String formatOrderStatus(String status) {
    return status.replaceAll('_', ' ').split(' ').map((word) => capitalizeFirst(word)).join(' ');
  }
}
