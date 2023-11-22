import 'package:btl/views/drawer.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const SideBArMenu(),
      appBar: AppBar(
        title: const Text("Trang chủ"),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {},
                child: const Text("Nộp tiền"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF07AB5C))),
            ElevatedButton(onPressed: () {}, child: const Text("Xem thong tin"))
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: const Icon(Icons.qr_code)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Trang chủ",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: "Thông báo",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.heart_broken),
                label: "Yêu thích",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Tra cứu",
                backgroundColor: Colors.blue),
          ]),
    );
  }
}
