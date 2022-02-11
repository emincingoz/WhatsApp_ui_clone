import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:kartal/src/context_extension.dart';
import 'package:whatsapp_ui_clone/constants/app_colors.dart';
import 'package:whatsapp_ui_clone/constants/app_icons.dart';
import 'package:whatsapp_ui_clone/constants/app_texts.dart';
import 'package:whatsapp_ui_clone/data/data.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 3, bottom: 7),
                child: ListTile(
                  title: const Text(
                    AppTexts.myStatusText,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: DashedCircle(
                    child: Padding(
                      padding: const EdgeInsets.all(3.5),
                      child: CircleAvatar(
                        backgroundImage:
                            const AssetImage("assets/images/user.png"),
                        radius: context.mediumValue - context.lowValue,
                      ),
                    ),
                    color: AppColors.myStatusDashedCircleColor,
                    dashes: 5,
                  ),
                  subtitle: const Text("Bugün 23:59"),
                  trailing: const Icon(
                    AppIcons.statusSettingsIcon,
                    color: AppColors.statusDashedCircleColor,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  child: Text(
                    AppTexts.statusPageUpdateText,
                    style: TextStyle(
                        color: AppColors.statusLastStatusTextColor,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            _dynamicElementGenerator,
            childCount: (userData.length ~/ 2),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  child: Text(
                    AppTexts.seenUpdatesText,
                    style: TextStyle(
                        color: AppColors.statusLastStatusTextColor,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            _dynamicElementGenerator,
            childCount: userData.length ~/ 2,
          ),
        ),
      ],
    );
  }

  Widget? _dynamicElementGenerator(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(
          userData[index].userName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: DashedCircle(
          child: Padding(
            padding: const EdgeInsets.all(3.5),
            child: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/' + userData[index].userImage),
              radius: context.mediumValue - context.lowValue,
            ),
          ),
          color: AppColors.statusDashedCircleColor,
          dashes: userData[index].statusCount!,
        ),
        subtitle: Text(userData[index].lastMessageTime),
      ),
    );
  }
}
