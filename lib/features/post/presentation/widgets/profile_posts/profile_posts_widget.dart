import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/utils/app_images.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/posted_content.dart';
import 'package:take_my_tym/features/post/presentation/pages/view_post_page.dart';

class ProfilePostsWidget extends StatelessWidget {
  const ProfilePostsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 20,
        (BuildContext context, int index) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 300.h,
              maxWidth: 600.h,
            ),
            child: HomePadding(
              child: PostedContentWidget(
                voidCallback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewPostPage()),
                  );
                },
                service: 'Remote',
                title: 'Timeless beauty of moments captured',
                image: MyAppImages.testOne,
                subtitle:
                    'Timeless beauty of moments capturedTimeless beauty of moments capturedTimeless beauty of moments capturedTimeless beauty of moments captured',
                width: MediaQuery.of(context).size.width,
              ),
            ),
          );
        },
      ),
    );
  }
}