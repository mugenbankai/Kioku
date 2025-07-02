import 'package:flutter/material.dart';
import 'pages/library_page.dart';
import 'pages/search_page.dart';
import 'pages/settings_page.dart';
import 'components/bottom_nav.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class KiokuApp extends StatefulWidget {
  const KiokuApp({Key? key}) : super(key: key);

  @override
  State<KiokuApp> createState() => _KiokuAppState();
}
class _KiokuAppState extends State<KiokuApp> {
  int _currentIndex = 0;
  Key libraryKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kioku',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [routeObserver],
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: const ColorScheme.dark(
          primary: Colors.tealAccent,
          secondary: Colors.teal,
        ),
      ),
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            LibraryPage(key: libraryKey),
            const SearchPage(),
            const SettingsPage(),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              if (index == 0) {
                libraryKey = UniqueKey();
              }
            });
          },
        ),
      ),
    );
  }
}
