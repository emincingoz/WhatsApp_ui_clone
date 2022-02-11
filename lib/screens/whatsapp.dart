//import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/constants/app_colors.dart';
import 'package:whatsapp_ui_clone/constants/app_icons.dart';
import 'package:whatsapp_ui_clone/constants/app_texts.dart';
import 'package:whatsapp_ui_clone/screens/calls_page.dart';
//import 'package:whatsapp_ui_clone/screens/camera_page.dart';
import 'package:whatsapp_ui_clone/screens/status_page.dart';
import 'package:whatsapp_ui_clone/screens/chats_page.dart';
import 'package:kartal/kartal.dart';

class WhatsappWidget extends StatefulWidget {
  const WhatsappWidget({Key? key}) : super(key: key);

  @override
  _WhatsappWidgetState createState() => _WhatsappWidgetState();
}

class _WhatsappWidgetState extends State<WhatsappWidget>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    /*Tab(
      icon: Icon(Icons.camera_alt),
    ),*/
    Tab(text: AppTexts.tabBarChatsTab),
    Tab(text: AppTexts.tabBarStatusTab),
    Tab(text: AppTexts.tabBarCallsTab),
  ];

  late TabController _tabController;
  late int _index = 0;
  List<Icon> icons = const [
    Icon(AppIcons.messageIcon),
    Icon(AppIcons.cameraIcon),
    Icon(AppIcons.newCallIcon)
  ];
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: 0, vsync: this, length: myTabs.length);
    _tabController.animation?.addListener(() {
      int value = _tabController.animation!.value.round();
      //print(value);
      if (_index != value) {
        setState(() => _index = value);
        //setState(() => _index = value - 1);
        //if (_index == -1) _index = 0;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: icons[_index],
          onPressed: () async {
            /*await availableCameras().then(
              (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraPage(
                    cameras: value,
                  ),
                ),
              ),
            );*/
          },
          backgroundColor: AppColors.appMainColor,
          elevation: 5,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                snap: true,
                floating: true,
                elevation: 5,
                backgroundColor: AppColors.appMainColor,
                title: AppTexts.whatsappName,
                toolbarHeight: context.dynamicHeight(0.07),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(AppIcons.searchIcon),
                  ),
                  IconButton(
                    // popupMenuButton
                    onPressed: () {},
                    icon: const Icon(AppIcons.menuIcon),
                  )
                ],
                bottom: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  //indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: AppColors.tabBarIndicatorColor,
                  indicatorWeight: 2.3,
                  labelPadding: context.horizontalPaddingMedium,
                  //labelPadding: const EdgeInsets.symmetric(horizontal: 25),
                  //labelPadding: const EdgeInsets.only(left: 18, right: 20),
                  tabs: myTabs,
                ),
              ),
            ];
          },
          body: TabBarView(
              //controller: ,
              controller: _tabController,
              children: const [
                //CameraPage(),
                ChatPage(),
                StatusPage(),
                CallsPage()
              ]),
        ),
      ),
    );
  }
}
