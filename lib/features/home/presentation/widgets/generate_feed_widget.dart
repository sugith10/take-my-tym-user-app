import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/model/app_post_model.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/widgets/posted_content.dart';
import '../../../view_post/presentation/pages/view_post_page.dart';

class GenerateFeedWidget extends StatelessWidget {
  final List<PostModel> posts;
  const GenerateFeedWidget({
    required this.posts,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(right: MyAppPadding.homePadding),
        child: Row(
          children: List.generate(posts.length, (index) {
            final postModel = posts[index];
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 180.h,
                ),
                child: PostedContentWidget(
                  voidCallback: () {
                    Navigator.push(
                        context, ViewPostPage.route(postModel: postModel));
                  },
                  // image: image,
                  postModel: postModel,
                  width: 300,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
