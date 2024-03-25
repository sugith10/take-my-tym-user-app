import 'package:flutter/material.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/posted_content.dart';
import 'package:take_my_tym/features/post/presentation/pages/post_page.dart';

class MyPosts extends StatelessWidget {
  const MyPosts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomePadding(
      child: ListView.builder(
        shrinkWrap: true,
        //  physics: NeverScrollableScrollPhysics(),
        primary: false,
        itemCount: 5,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: MyAppPadding.homePadding),
            child: PostedContentWidget(
              voidCallback: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PostPage()));
              },
              service: 'Remote',
              title: 'Timeless beauty of moments captured',
              image: MyAppImages.testOne,
              subtitle:
                  'Timeless beauty of moments capturedTimeless beauty of moments capturedTimeless beauty of moments capturedTimeless beauty of moments captured',
              width: MediaQuery.of(context).size.width,
            ),
          );
        }),
      ),
    );
  }
}
