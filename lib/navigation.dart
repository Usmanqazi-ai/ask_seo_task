import 'package:flutter/material.dart';
import 'package:task_ask_seo/screens/history_screen.dart';
import 'package:task_ask_seo/screens/home_screen.dart';
import 'package:task_ask_seo/utils/colors.dart';

class ManualNavigation extends StatefulWidget {
  const ManualNavigation({super.key});

  @override
  State<ManualNavigation> createState() => _ManualNavigationState();
}

class _ManualNavigationState extends State<ManualNavigation> {
  int _selectedIndex = 1;
  final List<Widget> _pages = [
    SearchHistoryPage(),
    HomeScreen(),
    Container(
      color: Colors.transparent,
      child: const Center(
          child: Text(
        "Setting",
        style: TextStyle(color: Colors.white, fontSize: 30),
      )),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Image.asset("assets/images/bd_img_top.png"),
        Positioned(
            bottom: 1, child: Image.asset("assets/images/bg_img_bottom.png")),
        Column(
          children: [
            Expanded(
              child: _pages[_selectedIndex],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              color: Colors.transparent,
              height: 110,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 2),
                child: Stack(
                  children: [
                    Positioned(
                      top: 15,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: UColors.textFiledColor),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 7),
                                decoration: BoxDecoration(
                                    color: _selectedIndex == 0
                                        ? UColors.primary
                                        : UColors.textFiledColor,
                                    borderRadius: BorderRadius.circular(30)),
                                child: GestureDetector(
                                  onTap: () {
                                    _onItemTapped(0);
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset("assets/icons/history.png"),
                                      const Text(
                                        "History",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 7),
                                decoration: BoxDecoration(
                                    color: _selectedIndex == 2
                                        ? UColors.primary
                                        : UColors.textFiledColor,
                                    borderRadius: BorderRadius.circular(30)),
                                child: GestureDetector(
                                  onTap: () {
                                    _onItemTapped(2);
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset("assets/icons/setting.png"),
                                      const Text(
                                        "Setting",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width / 3.8,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () => _onItemTapped(1),
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: _selectedIndex == 1
                                  ? Colors.transparent
                                  : UColors.textFiledColor,
                              image: _selectedIndex == 1
                                  ? const DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/active_home_btn.png"))
                                  : const DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/home_btn.png")),
                              border:
                                  Border.all(color: Colors.black, width: 4)),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
