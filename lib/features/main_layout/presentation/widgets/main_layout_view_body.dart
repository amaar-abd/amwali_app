import 'package:amwali/features/home/presentation/views/home_view.dart';
import 'package:amwali/features/main_layout/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainLayoutViewBody extends StatefulWidget {
  const MainLayoutViewBody({super.key});

  @override
  State<MainLayoutViewBody> createState() => _MainLayoutViewBodyState();
}

int _currentIndex = 0;
final List<Widget> _views = [
 const HomeView(), 
    const Center(child: Text('صفحة المعاملات')), 
    const Center(child: Text('صفحة المستشار')),   
    const Center(child: Text('الملف الشخصي')),
  ];

class _MainLayoutViewBodyState extends State<MainLayoutViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _views),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
