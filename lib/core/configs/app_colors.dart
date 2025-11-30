import 'package:flutter/material.dart';

/// AppColors - Centralized color palette for the Hungry app
///
/// This class contains all colors used throughout the application,
/// organized by their usage context for better maintainability.
/// All colors are derived from the design specifications.
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // ============================================================================
  // PRIMARY BRAND COLORS
  // ============================================================================

  /// Main brand color - Dark Green
  /// Used for: Primary buttons, bottom navigation, splash screen background,
  /// selected states, active elements
  static const Color primary = Color(0xFF08431D);

  /// Lighter variant of primary color
  /// Used for: Hover states, lighter accents
  static const Color primaryLight = Color(0xFF0A5424);

  /// Darker variant of primary color
  /// Used for: Pressed states, darker accents
  static const Color primaryDark = Color(0xFF063216);

  // ============================================================================
  // BACKGROUND COLORS
  // ============================================================================

  /// Main background color - Pure White
  /// Used for: Screen backgrounds, card backgrounds
  static const Color background = Color(0xFFFFFFFF);

  /// Light gray background
  /// Used for: Product image containers, subtle backgrounds
  static const Color backgroundGrey = Color(0xFFF5F5F5);

  /// Lighter gray background
  /// Used for: Search bars, input fields
  static const Color backgroundLightGrey = Color(0xFFF0F0F0);

  /// Dark green background
  /// Used for: Profile screen background, dark sections
  static const Color backgroundDark = Color(0xFF08431D);

  /// Black background
  /// Used for: Overlays, modals
  static const Color backgroundBlack = Color(0xFF000000);

  /// Main scaffold background
  /// Used for: Default screen background
  static const Color scaffoldBackground = Color(0xFFFFFFFF);

  // ============================================================================
  // TEXT COLORS
  // ============================================================================

  /// Primary text color - Very Dark Gray/Black
  /// Used for: Main headings, product names, important text
  static const Color textPrimary = Color(0xFF212121);

  /// Secondary text color - Medium Gray
  /// Used for: Descriptions, subtitles, helper text
  static const Color textSecondary = Color(0xFF757575);

  /// Tertiary text color - Dark Gray
  /// Used for: Less important text
  static const Color textTertiary = Color(0xFF424242);

  /// Hint text color - Light Gray
  /// Used for: Placeholder text, hints
  static const Color textHint = Color(0xFF9E9E9E);

  /// Light text color - White
  /// Used for: Text on dark backgrounds (buttons, nav bar, profile screen)
  static const Color textLight = Color(0xFFFFFFFF);

  /// Dark text color - Black
  /// Used for: High contrast text
  static const Color textDark = Color(0xFF000000);

  /// Brand color text
  /// Used for: Text that should match brand color
  static const Color textBrand = Color(0xFF08431D);

  // ============================================================================
  // BUTTON COLORS
  // ============================================================================

  /// Primary button background - Dark Green
  /// Used for: Add to Cart, Checkout, Pay Now, Save buttons
  static const Color buttonPrimary = Color(0xFF08431D);

  /// Primary button text - White
  /// Used for: Text on primary buttons
  static const Color buttonPrimaryText = Color(0xFFFFFFFF);

  /// Secondary button background - White
  /// Used for: Cancel, Back, alternative actions
  static const Color buttonSecondary = Color(0xFFFFFFFF);

  /// Secondary button text/border - Dark Green
  /// Used for: Text and border on secondary buttons
  static const Color buttonSecondaryText = Color(0xFF08431D);

  /// Danger button - Red
  /// Used for: Delete, Remove actions
  static const Color buttonDanger = Color(0xFFE53935);

  /// Disabled button - Gray
  /// Used for: Inactive/disabled buttons
  static const Color buttonDisabled = Color(0xFFBDBDBD);

  // ============================================================================
  // INPUT FIELD COLORS
  // ============================================================================

  /// Input field background - Light Gray
  /// Used for: Default input field backgrounds
  static const Color inputBackground = Color(0xFFF0F0F0);

  /// Input field background on dark - Transparent with white border
  /// Used for: Profile screen input fields
  static const Color inputBackgroundDark = Colors.transparent;

  /// Input field border - Light Gray
  /// Used for: Default input borders
  static const Color inputBorder = Color(0xFFE0E0E0);

  /// Input field border focused - Dark Green
  /// Used for: Focused input borders
  static const Color inputBorderFocused = Color(0xFF08431D);

  /// Input field border on dark - White
  /// Used for: Profile screen input borders
  static const Color inputBorderLight = Color(0xFFFFFFFF);

  /// Input text color
  /// Used for: Text inside input fields
  static const Color inputText = Color(0xFF212121);

  /// Input text color on dark - White
  /// Used for: Text in profile screen inputs
  static const Color inputTextLight = Color(0xFFFFFFFF);

  // ============================================================================
  // CARD COLORS
  // ============================================================================

  /// Card background - White
  /// Used for: Product cards, topping cards, order summary cards
  static const Color cardBackground = Color(0xFFFFFFFF);

  /// Card border - Light Gray
  /// Used for: Card outlines
  static const Color cardBorder = Color(0xFFE0E0E0);

  /// Card shadow - Black with opacity
  /// Used for: Card elevation shadows
  static const Color cardShadow = Color(0x1A000000);

  /// Product image background - Very Light Gray
  /// Used for: Background behind product images
  static const Color productImageBackground = Color(0xFFF5F5F5);

  // ============================================================================
  // CHIP COLORS (Category Selection)
  // ============================================================================

  /// Selected chip background - Dark Green
  /// Used for: Active category chip
  static const Color chipSelected = Color(0xFF08431D);

  /// Selected chip text - White
  /// Used for: Text on selected chip
  static const Color chipSelectedText = Color(0xFFFFFFFF);

  /// Unselected chip background - White
  /// Used for: Inactive category chips
  static const Color chipUnselected = Color(0xFFFFFFFF);

  /// Unselected chip text - Dark Gray
  /// Used for: Text on unselected chips
  static const Color chipUnselectedText = Color(0xFF212121);

  /// Chip border - Light Gray
  /// Used for: Chip outlines
  static const Color chipBorder = Color(0xFFE0E0E0);

  // ============================================================================
  // BOTTOM NAVIGATION COLORS
  // ============================================================================

  /// Bottom nav background - Dark Green
  /// Used for: Bottom navigation bar background
  static const Color navBarBackground = Color(0xFF08431D);

  /// Selected nav item - White
  /// Used for: Active navigation icon and label
  static const Color navBarSelected = Color(0xFFFFFFFF);

  /// Unselected nav item - White with opacity
  /// Used for: Inactive navigation icon and label
  static const Color navBarUnselected = Color(0xB3FFFFFF); // 70% opacity white

  // ============================================================================
  // ICON COLORS
  // ============================================================================

  /// Primary icon color - Dark Green
  /// Used for: Brand colored icons
  static const Color iconPrimary = Color(0xFF08431D);

  /// Secondary icon color - Medium Gray
  /// Used for: Search icons, general icons
  static const Color iconSecondary = Color(0xFF757575);

  /// Light icon color - White
  /// Used for: Icons on dark backgrounds
  static const Color iconLight = Color(0xFFFFFFFF);

  /// Dark icon color - Black
  /// Used for: Icons on light backgrounds
  static const Color iconDark = Color(0xFF000000);

  // ============================================================================
  // RATING COLORS
  // ============================================================================

  /// Rating star filled - Yellow/Gold
  /// Used for: Filled star icons in ratings
  static const Color ratingStar = Color(0xFFFFC107);

  /// Rating star empty - Light Gray
  /// Used for: Empty star icons in ratings
  static const Color ratingStarEmpty = Color(0xFFE0E0E0);

  // ============================================================================
  // STATUS COLORS
  // ============================================================================

  /// Success color - Green
  /// Used for: Success messages, checkmarks, confirmations
  static const Color success = Color(0xFF4CAF50);

  /// Success light background
  /// Used for: Success message backgrounds
  static const Color successLight = Color(0xFFE8F5E9);

  /// Error color - Red
  /// Used for: Error messages, validation errors
  static const Color error = Color(0xFFE53935);

  /// Error light background
  /// Used for: Error message backgrounds
  static const Color errorLight = Color(0xFFFFEBEE);

  /// Warning color - Orange/Yellow
  /// Used for: Warning messages, alerts
  static const Color warning = Color(0xFFFFC107);

  /// Warning light background
  /// Used for: Warning message backgrounds
  static const Color warningLight = Color(0xFFFFF8E1);

  /// Info color - Blue
  /// Used for: Info messages, tips
  static const Color info = Color(0xFF2196F3);

  /// Info light background
  /// Used for: Info message backgrounds
  static const Color infoLight = Color(0xFFE3F2FD);

  // ============================================================================
  // BORDER & DIVIDER COLORS
  // ============================================================================

  /// Standard border color - Light Gray
  /// Used for: General borders, dividers
  static const Color border = Color(0xFFE0E0E0);

  /// Divider color - Very Light Gray
  /// Used for: Section dividers
  static const Color divider = Color(0xFFEEEEEE);

  /// Border on dark background - White
  /// Used for: Borders on dark backgrounds (profile screen)
  static const Color borderLight = Color(0xFFFFFFFF);

  // ============================================================================
  // OVERLAY COLORS
  // ============================================================================

  /// Dark overlay - Black with 50% opacity
  /// Used for: Modal backgrounds, dimmed overlays
  static const Color overlay = Color(0x80000000);

  /// Light overlay - Black with 10% opacity
  /// Used for: Subtle overlays
  static const Color overlayLight = Color(0x1A000000);

  /// Success screen overlay - Gray
  /// Used for: Background overlay on success screen
  static const Color overlayGrey = Color(0xFF9E9E9E);

  // ============================================================================
  // QUANTITY CONTROL COLORS
  // ============================================================================

  /// Quantity button background - Dark Green
  /// Used for: Plus/minus buttons in cart
  static const Color quantityButtonBackground = Color(0xFF08431D);

  /// Quantity button icon - White
  /// Used for: Plus/minus icons
  static const Color quantityButtonIcon = Color(0xFFFFFFFF);

  /// Quantity text color - Black
  /// Used for: Number display
  static const Color quantityText = Color(0xFF212121);

  // ============================================================================
  // TOPPING SELECTION COLORS
  // ============================================================================

  /// Topping unselected border - Light Gray
  /// Used for: Topping card borders
  static const Color toppingBorder = Color(0xFFE0E0E0);

  /// Topping selected border - Purple/Blue
  /// Used for: Selected topping card border
  static const Color toppingSelected = Color(0xFF7C4DFF);

  /// Topping add button background - Purple
  /// Used for: Plus icon background on toppings
  static const Color toppingAddButton = Color(0xFF7C4DFF);

  /// Topping add button icon - White
  /// Used for: Plus icon color
  static const Color toppingAddButtonIcon = Color(0xFFFFFFFF);

  // ============================================================================
  // SLIDER COLORS (Spicy Level)
  // ============================================================================

  /// Slider active track - Dark Green
  /// Used for: Active portion of spicy slider
  static const Color sliderActive = Color(0xFF08431D);

  /// Slider inactive track - Light Gray
  /// Used for: Inactive portion of spicy slider
  static const Color sliderInactive = Color(0xFFE0E0E0);

  /// Slider thumb - Dark Green
  /// Used for: Slider thumb/handle
  static const Color sliderThumb = Color(0xFF08431D);

  // ============================================================================
  // PAYMENT METHOD COLORS
  // ============================================================================

  /// Payment method selected background - Dark Green
  /// Used for: Selected payment method card
  static const Color paymentSelected = Color(0xFF08431D);

  /// Payment method unselected background - White
  /// Used for: Unselected payment methods
  static const Color paymentUnselected = Color(0xFFFFFFFF);

  /// Payment border - Light Gray
  /// Used for: Payment card borders
  static const Color paymentBorder = Color(0xFFE0E0E0);

  /// VISA card background - Blue
  /// Used for: VISA payment card background
  static const Color visaCardBackground = Color(0xFF1A237E);

  /// VISA card text - White
  /// Used for: Text on VISA card
  static const Color visaCardText = Color(0xFFFFFFFF);

  /// Save card checkbox - Red
  /// Used for: Checkbox for saving card
  static const Color saveCardCheckbox = Color(0xFFF44336);

  // ============================================================================
  // SEARCH BAR COLORS
  // ============================================================================

  /// Search bar background - Light Gray
  /// Used for: Search input background
  static const Color searchBackground = Color(0xFFF0F0F0);

  /// Search icon - Medium Gray
  /// Used for: Search icon color
  static const Color searchIcon = Color(0xFF757575);

  /// Search text - Dark Gray/Black
  /// Used for: Search input text
  static const Color searchText = Color(0xFF212121);

  /// Search hint - Light Gray
  /// Used for: Search placeholder text
  static const Color searchHint = Color(0xFF9E9E9E);

  // ============================================================================
  // SPECIAL SCREEN COLORS
  // ============================================================================

  /// Splash screen background - Dark Green
  /// Used for: Splash screen only
  static const Color splashBackground = Color(0xFF08431D);

  /// Splash screen text - White
  /// Used for: "HUNGRY?" text on splash
  static const Color splashText = Color(0xFFFFFFFF);

  /// Success dialog background - White
  /// Used for: Success modal background
  static const Color successDialogBackground = Color(0xFFFFFFFF);

  /// Success checkmark background - Dark Green
  /// Used for: Success checkmark circle
  static const Color successCheckmarkBackground = Color(0xFF08431D);

  /// Success checkmark icon - White
  /// Used for: Checkmark icon
  static const Color successCheckmarkIcon = Color(0xFFFFFFFF);

  // ============================================================================
  // PROFILE SCREEN SPECIFIC COLORS
  // ============================================================================

  /// Profile background - Dark Green
  /// Used for: Profile screen background
  static const Color profileBackground = Color(0xFF08431D);

  /// Profile image border - White
  /// Used for: User profile image border
  static const Color profileImageBorder = Color(0xFFFFFFFF);

  /// Profile icon - White
  /// Used for: Back and settings icons
  static const Color profileIcon = Color(0xFFFFFFFF);

  /// Profile input label - White
  /// Used for: Input field labels
  static const Color profileInputLabel = Color(0xFFFFFFFF);

  // ============================================================================
  // UTILITY COLORS
  // ============================================================================

  /// Pure white - for specific use cases
  static const Color white = Color(0xFFFFFFFF);

  /// Pure black - for specific use cases
  static const Color black = Color(0xFF000000);

  /// Transparent - for specific use cases
  static const Color transparent = Colors.transparent;
}

// ==============================================================================
// COLOR EXTENSIONS
// ==============================================================================

/// Extension for easy opacity variations on any Color
///
/// Usage: AppColors.primary.withOpacity20
extension AppColorExtension on Color {
  /// 10% opacity
  Color get withOpacity10 => withValues(alpha: 0.1);

  /// 20% opacity
  Color get withOpacity20 => withValues(alpha: 0.2);

  /// 30% opacity
  Color get withOpacity30 => withValues(alpha: 0.3);

  /// 40% opacity
  Color get withOpacity40 => withValues(alpha: 0.4);

  /// 50% opacity
  Color get withOpacity50 => withValues(alpha: 0.5);

  /// 60% opacity
  Color get withOpacity60 => withValues(alpha: 0.6);

  /// 70% opacity
  Color get withOpacity70 => withValues(alpha: 0.7);

  /// 80% opacity
  Color get withOpacity80 => withValues(alpha: 0.8);

  /// 90% opacity
  Color get withOpacity90 => withValues(alpha: 0.9);
}
