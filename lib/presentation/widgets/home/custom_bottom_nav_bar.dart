import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap; //? valueChanged is a common callback type like in typescript
  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    /* Obtiene los colores del colorScheme del tema actual de la app, este esquema
    se define en el TemaData que se le pasa a material app */
    final colors = Theme.of(context).colorScheme;
    final greyColor = Colors.grey;
    final withe70Color = Colors.white70;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colors.primary,
      currentIndex: selectedIndex,
      //*LABEL OPTIONS
      selectedItemColor: withe70Color,
      unselectedItemColor: greyColor,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: onTap,
      items: [
        //?cada bloque puede tener su propio color
        _buildBottomNavigationBarItem(
          activeIcon: Icons.maps_home_work,
          icon: Icons.maps_home_work_outlined,
          label: 'Home',
          fontSizes: 28,
          activeIconColor: withe70Color,
          unactiveIconColor: greyColor
        ),
        _buildBottomNavigationBarItem(
          activeIcon: Icons.notifications,
          icon: Icons.notifications_outlined,
          label: 'Notifications',
          fontSizes: 28,
          activeIconColor: withe70Color,
          unactiveIconColor: greyColor
        ),
        _buildBottomNavigationBarItem(
          activeIcon: Icons.person,
          icon: Icons.person_outline_outlined,
          label: 'Account',
          fontSizes: 28,
          activeIconColor:withe70Color,
          unactiveIconColor: greyColor
        ),
      ],
    );
  }
}

BottomNavigationBarItem _buildBottomNavigationBarItem({
  required IconData activeIcon,
  required IconData icon,
  required String label,
  required Color activeIconColor,
  required Color unactiveIconColor,
  required double fontSizes,
}) {
  return BottomNavigationBarItem(
    activeIcon: Icon(activeIcon, color: activeIconColor, size: fontSizes),
    icon: Icon(icon, color: unactiveIconColor, size: fontSizes),
    label: label,
  );
}