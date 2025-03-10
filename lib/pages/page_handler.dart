import 'package:boiler_plate/pages/home_page.dart';
import 'package:boiler_plate/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import '../widgets/index_provider.dart';
import '../widgets/route_button.dart';


class PageHandler extends StatefulWidget {
  const PageHandler({super.key});

  @override
  State<PageHandler> createState() => _PageHandlerState();
}

class _PageHandlerState extends State<PageHandler> {
  @override
  Widget build(BuildContext context) {

    final pages = [
      const ProfilePage(),
      const HomePage(),
    ];
    int pageIndex = Provider.of<PageIndexProvider>(context).pageIndex;
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return WillPopScope(
      onWillPop: () async {
        if (pageIndex == 0) SystemNavigator.pop();
        changePage(index: 0, context: context);
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: IndexedStack(
          index: pageIndex,
          children: pages,
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: _buildBottomNavBar(pageIndex),
      ),
    );
  }

  Widget _buildBottomNavBar(int pageIndex) {
    return BottomAppBar(
      child: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RouteButton(
              routeName: "Profile",
              filePath: "assets/icons/profile.png",
              routeCallback: () => changePage(index: 0, context: context),
              currentIndex: pageIndex,
              routeIndex: 0,
            ),
            RouteButton(
              routeName: "Home",
              filePath: "assets/icons/home.png",
              routeCallback: () => changePage(index: 1, context: context),
              currentIndex: pageIndex,
              routeIndex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
