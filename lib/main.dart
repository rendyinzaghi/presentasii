import 'package:flutter/material.dart';
import 'package:masakankhas_indonesia/data/masakan_data.dart';
import 'package:masakankhas_indonesia/screens/detail_screen.dart';
import 'package:masakankhas_indonesia/screens/home_screen.dart';
import 'package:masakankhas_indonesia/screens/profile_screen.dart';
import 'package:masakankhas_indonesia/screens/search_screen.dart';
import 'package:masakankhas_indonesia/screens/sign_in_screen.dart';
import 'package:masakankhas_indonesia/screens/sign_up_screen.dart';
import 'package:masakankhas_indonesia/screens/favorite_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Masakan Khas Indonesia',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.blue),
          titleTextStyle: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue).copyWith(
          primary: Colors.blue,
          surface: Colors.blue[50],
        ),
        useMaterial3: true,
      ),
      home: MainScreen(),
      initialRoute: '/',
      routes: {
        '/homescreen': (context) => const HomeScreen(),
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) =>  SignUpScreen(),
        '/favorite' :(context) => FavoriteScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // TODO : 1. Deklerasikan variabel
  int _currentIndex = 0;
  final List<Widget> _children = [
    const HomeScreen(),
    const SearchScreen(),
    FavoriteScreen(),
    const ProfilScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO : 2. Buat Properti body berupa widget yang ditampilkan
      body: _children[_currentIndex],
      // TODO : 3. Buat properti bottomNavigationBar dengan nilai theme
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.blue[50]
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.blue,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.blue,),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.blue,),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.blue,),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.blue[100],
          showUnselectedLabels: true,
        ),
      ),
      // TODO : 4. Buat data dan child dari theme
    );

  }
}

