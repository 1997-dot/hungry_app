import 'package:flutter/material.dart';
import '../configs/app_colors.dart';

/// AppBottomNavBar - Reusable bottom navigation bar for the Hungry app
///
/// Provides a consistent bottom navigation across all main screens with:
/// - Dark green background (#08431D)
/// - 30px rounded top corners
/// - 4 navigation items: Home, Cart, Search, Profile
/// - White icons when selected, semi-transparent white when unselected
/// - Smooth transitions and haptic feedback
///
/// Integrates with the app's design system using AppColors
///
/// Usage:
/// ```dart
/// AppBottomNavBar(
///   currentIndex: _currentIndex,
///   onTap: (index) {
///     setState(() {
///       _currentIndex = index;
///     });
///   },
/// )
/// ```

class AppBottomNavBar extends StatelessWidget {
  /// Current selected index (0-3)
  final int currentIndex;

  /// Callback when a tab is tapped
  final Function(int) onTap;

  /// Whether to show labels
  final bool showLabels;

  /// Custom height
  final double? height;

  const AppBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    this.showLabels = false,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.navBarBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: AppColors.navBarSelected,
          unselectedItemColor: AppColors.navBarUnselected,
          showSelectedLabels: showLabels,
          showUnselectedLabels: showLabels,
          elevation: 0,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          iconSize: 24,
          items: _buildNavigationItems(),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildNavigationItems() {
    return [
      _buildNavItem(
        icon: Icons.home_outlined,
        activeIcon: Icons.home,
        label: 'Home',
      ),
      _buildNavItem(
        icon: Icons.shopping_cart_outlined,
        activeIcon: Icons.shopping_cart,
        label: 'Cart',
      ),
      _buildNavItem(
        icon: Icons.search_outlined,
        activeIcon: Icons.search,
        label: 'Search',
      ),
      _buildNavItem(
        icon: Icons.person_outline,
        activeIcon: Icons.person,
        label: 'Profile',
      ),
    ];
  }

  BottomNavigationBarItem _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(activeIcon),
      label: label,
      tooltip: label,
    );
  }
}

// ==============================================================================
// NAVIGATION ITEMS ENUM (For type safety)
// ==============================================================================

/// Navigation item indices for type-safe navigation
enum AppNavItem {
  /// Home tab (index 0)
  home,

  /// Cart tab (index 1)
  cart,

  /// Search tab (index 2)
  search,

  /// Profile tab (index 3)
  profile;

  /// Get nav item from index
  static AppNavItem fromIndex(int index) {
    if (index >= 0 && index < AppNavItem.values.length) {
      return AppNavItem.values[index];
    }
    return AppNavItem.home;
  }
}

// ==============================================================================
// CUSTOM BOTTOM NAV BAR (Advanced version with custom painting)
// ==============================================================================

/// Custom bottom navigation bar with advanced styling options
/// Use this if you need more customization beyond the standard BottomNavigationBar
class AppCustomBottomNavBar extends StatelessWidget {
  /// Current selected index (0-3)
  final int currentIndex;

  /// Callback when a tab is tapped
  final Function(int) onTap;

  /// Navigation items
  final List<AppNavBarItem> items;

  /// Background color
  final Color? backgroundColor;

  /// Selected item color
  final Color? selectedColor;

  /// Unselected item color
  final Color? unselectedColor;

  /// Border radius
  final double borderRadius;

  /// Height
  final double height;

  const AppCustomBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.borderRadius = 30,
    this.height = 70,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.navBarBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (index) => _buildNavButton(index),
        ),
      ),
    );
  }

  Widget _buildNavButton(int index) {
    final item = items[index];
    final isSelected = currentIndex == index;
    final color = isSelected
        ? (selectedColor ?? AppColors.navBarSelected)
        : (unselectedColor ?? AppColors.navBarUnselected);

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isSelected ? item.activeIcon : item.icon,
                color: color,
                size: 24,
              ),
              if (item.label != null) ...[
                const SizedBox(height: 4),
                Text(
                  item.label!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: color,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Navigation bar item data model
class AppNavBarItem {
  /// Icon when not selected
  final IconData icon;

  /// Icon when selected
  final IconData activeIcon;

  /// Optional label text
  final String? label;

  /// Optional badge count
  final int? badgeCount;

  const AppNavBarItem({
    required this.icon,
    required this.activeIcon,
    this.label,
    this.badgeCount,
  });

  /// Home navigation item
  static const AppNavBarItem home = AppNavBarItem(
    icon: Icons.home_outlined,
    activeIcon: Icons.home,
    label: 'Home',
  );

  /// Cart navigation item
  static const AppNavBarItem cart = AppNavBarItem(
    icon: Icons.shopping_cart_outlined,
    activeIcon: Icons.shopping_cart,
    label: 'Cart',
  );

  /// Search navigation item
  static const AppNavBarItem search = AppNavBarItem(
    icon: Icons.search_outlined,
    activeIcon: Icons.search,
    label: 'Search',
  );

  /// Profile navigation item
  static const AppNavBarItem profile = AppNavBarItem(
    icon: Icons.person_outline,
    activeIcon: Icons.person,
    label: 'Profile',
  );

  /// Default navigation items for the app
  static const List<AppNavBarItem> defaultItems = [
    home,
    cart,
    search,
    profile,
  ];
}

// ==============================================================================
// NAVIGATION BAR WITH BADGE SUPPORT
// ==============================================================================

/// Bottom navigation bar with badge support for cart items
class AppBottomNavBarWithBadge extends StatelessWidget {
  /// Current selected index (0-3)
  final int currentIndex;

  /// Callback when a tab is tapped
  final Function(int) onTap;

  /// Cart item count for badge
  final int cartItemCount;

  /// Whether to show labels
  final bool showLabels;

  const AppBottomNavBarWithBadge({
    required this.currentIndex,
    required this.onTap,
    this.cartItemCount = 0,
    this.showLabels = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.navBarBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: AppColors.navBarSelected,
          unselectedItemColor: AppColors.navBarUnselected,
          showSelectedLabels: showLabels,
          showUnselectedLabels: showLabels,
          elevation: 0,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          iconSize: 24,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              activeIcon: const Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildCartIconWithBadge(false),
              activeIcon: _buildCartIconWithBadge(true),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.search_outlined),
              activeIcon: const Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline),
              activeIcon: const Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartIconWithBadge(bool isActive) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(
          isActive ? Icons.shopping_cart : Icons.shopping_cart_outlined,
        ),
        if (cartItemCount > 0)
          Positioned(
            right: -8,
            top: -8,
            child: Container(
              padding: const EdgeInsets.all(4),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              decoration: BoxDecoration(
                color: AppColors.error,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                cartItemCount > 99 ? '99+' : cartItemCount.toString(),
                style: const TextStyle(
                  color: AppColors.textLight,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
