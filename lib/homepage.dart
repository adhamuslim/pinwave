import 'package:flutter/material.dart';
import 'profile.dart';
import 'beranda.dart';
import 'search.dart';

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
      home: MyHomePage(title: 'ABP MINGGU 11'),
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
            Center(
              child: InkWell(
                child: Text('Go To Home page', style: TextStyle(fontSize: 30, color: Colors.blue)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const homepage()
                    ));
                },
              )
            ),
            Center(
              child: Text('search page', style: TextStyle(fontSize: 30)),
            ),
            Center(
              child: Text('create page', style: TextStyle(fontSize: 30)),
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
            label : 'search'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 48),
            label : ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'notification', 
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            label: "profile",
          )
        ],
      ),
    );
  }
}
