import 'package:flutter/material.dart';
import 'profile.dart';
void main() {
  runApp(const Pinwave());
}

class Pinwave extends StatelessWidget {
  const Pinwave ({Key? key}) : super(key: key); 

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
                    builder: (context) => const Pinwave()
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
        selectedItemColor: Color.fromARGB(0, 2, 18, 252),
        unselectedItemColor: Color.fromARGB(0, 17, 119, 255),
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
            icon: Icon(Icons.plus_one),
            label: 'create', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "profile"
          )
        ],
      ),
    );
  }
}