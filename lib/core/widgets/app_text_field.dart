import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../configs/app_colors.dart';
import '../configs/app_fonts.dart';

/// AppTextField - Reusable text input component for the Hungry app
///
/// Provides multiple input field variants:
/// - Standard: Light gray background (login, signup forms)
/// - Search: Light gray background with search icon
/// - Profile: Transparent background with white border (for dark backgrounds)
/// - Password: Standard field with visibility toggle
///
/// Integrates with the app's design system using AppColors and AppTextStyles
///
/// Usage:
/// ```dart
/// AppTextField(
///   label: 'Email',
///   hint: 'Enter your email',
///   controller: emailController,
/// )
///
/// AppTextField.search(
///   hint: 'Search',
///   onChanged: (value) {},
/// )
///
/// AppTextField.password(
///   label: 'Password',
///   controller: passwordController,
/// )
///
/// AppTextField.profile(
///   label: 'Name',
///   controller: nameController,
/// )
/// ```

enum AppTextFieldVariant {
  /// Standard input - Light gray background
  standard,

  /// Search input - Light gray background with search icon
  search,

  /// Profile input - Transparent background with white border
  profile,

  /// Password input - Standard with visibility toggle
  password,
}

class AppTextField extends StatefulWidget {
  /// Label text displayed above the field
  final String? label;

  /// Placeholder text
  final String? hint;

  /// Text controller
  final TextEditingController? controller;

  /// Input variant
  final AppTextFieldVariant variant;

  /// Prefix icon
  final IconData? prefixIcon;

  /// Suffix icon
  final IconData? suffixIcon;

  /// Suffix icon callback
  final VoidCallback? onSuffixIconPressed;

  /// Validation function
  final String? Function(String?)? validator;

  /// On changed callback
  final Function(String)? onChanged;

  /// On submitted callback
  final Function(String)? onSubmitted;

  /// Keyboard type
  final TextInputType? keyboardType;

  /// Text input action
  final TextInputAction? textInputAction;

  /// Whether field is enabled
  final bool enabled;

  /// Whether field is read-only
  final bool readOnly;

  /// Maximum lines
  final int? maxLines;

  /// Maximum length
  final int? maxLength;

  /// Input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Auto focus
  final bool autofocus;

  /// Obscure text (for password)
  final bool obscureText;

  /// Custom border radius
  final double? borderRadius;

  /// Custom background color
  final Color? backgroundColor;

  /// Custom text color
  final Color? textColor;

  const AppTextField({
    this.label,
    this.hint,
    this.controller,
    this.variant = AppTextFieldVariant.standard,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.inputFormatters,
    this.autofocus = false,
    this.obscureText = false,
    this.borderRadius,
    this.backgroundColor,
    this.textColor,
    super.key,
  });

  /// Search field - Light gray background with search icon
  factory AppTextField.search({
    String? hint = 'Search',
    TextEditingController? controller,
    Function(String)? onChanged,
    Function(String)? onSubmitted,
    bool autofocus = false,
    Key? key,
  }) {
    return AppTextField(
      hint: hint,
      controller: controller,
      variant: AppTextFieldVariant.search,
      prefixIcon: Icons.search,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.search,
      autofocus: autofocus,
      key: key,
    );
  }

  /// Password field - Standard with visibility toggle
  factory AppTextField.password({
    String? label = 'Password',
    String? hint,
    TextEditingController? controller,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    TextInputAction? textInputAction,
    Key? key,
  }) {
    return AppTextField(
      label: label,
      hint: hint,
      controller: controller,
      variant: AppTextFieldVariant.password,
      validator: validator,
      onChanged: onChanged,
      textInputAction: textInputAction,
      obscureText: true,
      key: key,
    );
  }

  /// Profile field - Transparent background with white border (for dark backgrounds)
  factory AppTextField.profile({
    required String label,
    String? hint,
    TextEditingController? controller,
    IconData? prefixIcon,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    bool enabled = true,
    bool readOnly = false,
    Key? key,
  }) {
    return AppTextField(
      label: label,
      hint: hint,
      controller: controller,
      variant: AppTextFieldVariant.profile,
      prefixIcon: prefixIcon,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      enabled: enabled,
      readOnly: readOnly,
      key: key,
    );
  }

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: _getLabelStyle(),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          autofocus: widget.autofocus,
          obscureText: _obscureText,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatters,
          validator: widget.validator,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          style: _getTextStyle(),
          decoration: _getInputDecoration(),
        ),
      ],
    );
  }

  // ==========================================================================
  // DECORATION BUILDER
  // ==========================================================================

  InputDecoration _getInputDecoration() {
    final isProfile = widget.variant == AppTextFieldVariant.profile;

    return InputDecoration(
      hintText: widget.hint,
      hintStyle: _getHintStyle(),
      filled: true,
      fillColor: widget.backgroundColor ?? _getBackgroundColor(),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

      // Prefix icon
      prefixIcon: widget.prefixIcon != null
          ? Icon(
              widget.prefixIcon,
              color: _getIconColor(),
              size: 20,
            )
          : null,

      // Suffix icon
      suffixIcon: _buildSuffixIcon(),

      // Borders
      border: _getBorder(isProfile),
      enabledBorder: _getBorder(isProfile),
      focusedBorder: _getFocusedBorder(isProfile),
      errorBorder: _getErrorBorder(isProfile),
      focusedErrorBorder: _getErrorBorder(isProfile),
      disabledBorder: _getBorder(isProfile),

      // Counter (hide it)
      counterText: '',
    );
  }

  Widget? _buildSuffixIcon() {
    // Password visibility toggle
    if (widget.variant == AppTextFieldVariant.password) {
      return IconButton(
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        icon: Icon(
          _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          color: _getIconColor(),
          size: 20,
        ),
      );
    }

    // Custom suffix icon
    if (widget.suffixIcon != null) {
      return IconButton(
        onPressed: widget.onSuffixIconPressed,
        icon: Icon(
          widget.suffixIcon,
          color: _getIconColor(),
          size: 20,
        ),
      );
    }

    return null;
  }

  // ==========================================================================
  // BORDER BUILDERS
  // ==========================================================================

  OutlineInputBorder _getBorder(bool isProfile) {
    if (isProfile) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
        borderSide: BorderSide(
          color: AppColors.inputBorderLight,
          width: 1.5,
        ),
      );
    }

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
      borderSide: BorderSide.none,
    );
  }

  OutlineInputBorder _getFocusedBorder(bool isProfile) {
    if (isProfile) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
        borderSide: BorderSide(
          color: AppColors.inputBorderLight,
          width: 2,
        ),
      );
    }

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
      borderSide: BorderSide(
        color: AppColors.inputBorderFocused,
        width: 2,
      ),
    );
  }

  OutlineInputBorder _getErrorBorder(bool isProfile) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
      borderSide: BorderSide(
        color: AppColors.error,
        width: 2,
      ),
    );
  }

  // ==========================================================================
  // STYLE GETTERS
  // ==========================================================================

  Color _getBackgroundColor() {
    if (widget.variant == AppTextFieldVariant.profile) {
      return AppColors.inputBackgroundDark;
    }
    return AppColors.inputBackground;
  }

  Color _getIconColor() {
    if (widget.variant == AppTextFieldVariant.profile) {
      return AppColors.iconLight;
    }
    return AppColors.iconSecondary;
  }

  TextStyle _getTextStyle() {
    if (widget.variant == AppTextFieldVariant.profile) {
      return AppSpecificTextStyles.input.copyWith(
        color: widget.textColor ?? AppColors.inputTextLight,
      );
    }
    return AppSpecificTextStyles.input.copyWith(
      color: widget.textColor ?? AppColors.inputText,
    );
  }

  TextStyle _getHintStyle() {
    if (widget.variant == AppTextFieldVariant.profile) {
      return AppSpecificTextStyles.inputHint.copyWith(
        color: AppColors.textLight.withValues(alpha: 0.6),
      );
    }
    return AppSpecificTextStyles.inputHint;
  }

  TextStyle _getLabelStyle() {
    if (widget.variant == AppTextFieldVariant.profile) {
      return AppSpecificTextStyles.inputLabel.copyWith(
        color: AppColors.profileInputLabel,
      );
    }
    return AppSpecificTextStyles.inputLabel;
  }
}

// ==============================================================================
// SPECIALIZED TEXT FIELD WIDGETS
// ==============================================================================

/// Email text field with email keyboard and validation
class AppEmailField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;

  const AppEmailField({
    this.label = 'Email',
    this.hint,
    this.controller,
    this.validator,
    this.onChanged,
    this.textInputAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: label,
      hint: hint ?? 'Enter your email',
      controller: controller,
      prefixIcon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction ?? TextInputAction.next,
      validator: validator ?? _defaultEmailValidator,
      onChanged: onChanged,
    );
  }

  String? _defaultEmailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }
}

/// Phone number text field with phone keyboard
class AppPhoneField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;

  const AppPhoneField({
    this.label = 'Phone Number',
    this.hint,
    this.controller,
    this.validator,
    this.onChanged,
    this.textInputAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: label,
      hint: hint ?? 'Enter your phone number',
      controller: controller,
      prefixIcon: Icons.phone_outlined,
      keyboardType: TextInputType.phone,
      textInputAction: textInputAction ?? TextInputAction.done,
      validator: validator,
      onChanged: onChanged,
    );
  }
}

/// Multi-line text field for longer text input
class AppTextArea extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final int maxLines;
  final int? maxLength;

  const AppTextArea({
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.onChanged,
    this.maxLines = 4,
    this.maxLength,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: label,
      hint: hint,
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      textInputAction: TextInputAction.newline,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
