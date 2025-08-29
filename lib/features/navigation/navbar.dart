import 'package:flutter/material.dart';
import 'package:hesapkitap/core/theme/app_colors.dart';
import 'package:hesapkitap/features/home/admin_home_page.dart';
import 'package:hesapkitap/features/home/approver_home_page.dart';
import 'package:hesapkitap/features/home/user_home_page.dart';
import 'package:hesapkitap/features/profile/profile_page.dart';

class BottomNavWrapper extends StatefulWidget {
  final String role;
  final String name;
  final String email;

  const BottomNavWrapper({
    super.key,
    required this.role,
    required this.name,
    required this.email,
  });

  @override
  State<BottomNavWrapper> createState() => _BottomNavWrapperState();
}

class _BottomNavWrapperState extends State<BottomNavWrapper> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      // Role'a göre ana sayfa
      if (widget.role == "Admin")
        AdminHomePage()
      else if (widget.role == "Onaycı")
        ApproverHomePage()
      else
        UserHomePage(),
      ProfilePage(
        name: widget.name,
        email: widget.email,
        role: '',
        company: '',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.accent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: AppColors.textLight,
            unselectedItemColor: AppColors.textLight.withOpacity(0.7),
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Ana Sayfa",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profil",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
