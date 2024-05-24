import 'package:flutter/material.dart';
import 'beranda.dart';
import 'search.dart';
import 'profile.dart';

void main() {
  runApp(const homepage());
}

class homepage extends StatelessWidget {
  const homepage ({Key? key}) : super(key: key); 

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'PinWave',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'PinWave'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key,  required this.title}) : super(key : key);

  final String title;
  @override 
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selected = 0;
  PageController pc = PageController(initialPage: 0);

  @override 
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          controller: pc,
          onPageChanged: (index) {
            setState(() {
              selected = index;
            });
          },
          children: [
            Beranda(), // Ganti dengan BerandaPage()
            SearchPage(), // Ganti dengan SearchPage()
            Center(
              child: Text('create page', style: TextStyle(fontSize: 30)),
            ),
            Center(
              child: Text('notifikasi', style: TextStyle(fontSize: 30)),
            ),
            HomePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.blue,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
          });
          pc.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label : 'Search'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 48),
            label : ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification', 
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/gambar.jpg'),
            ),
            label: "Profile",
          )
        ],
      ),
    );
  }
}
