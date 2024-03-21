import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/widgets/app_bar_title.dart';
import 'package:take_my_tym/core/widgets/circle_profile_picture_widget.dart';
import 'package:take_my_tym/core/widgets/settings_button.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: const AppBarTitle(title: 'Inbox'),
            actions: [
              SettingsButton(
                callback: () {},
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              addAutomaticKeepAlives: true,
              [
                ListTile(
                  leading: const CircleProfilePicWidget(
                    height: 50,
                    width: 50,
                    image: MyAppImages.testProfile,
                  ),
                  title: Text(
                    'Sugith',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Text(
                    'hello sugith',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  trailing: Text(
                    '12:24 pm',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
               const Padding(
                  padding: EdgeInsets.only(
                    left: MyAppPadding.homePadding,
                    right: MyAppPadding.homePadding,
                  ),
                  child: Divider(),
                ),
                ListTile(
                  leading: const CircleProfilePicWidget(
                    height: 50,
                    width: 50,
                    image: MyAppImages.testProfile,
                  ),
                  title: Text(
                    'Sugith',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Text(
                    'hello sugith',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  trailing: Text(
                    '12:24 pm',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
