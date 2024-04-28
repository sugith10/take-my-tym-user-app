import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/widgets/posted_content.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/view_post/presentation/pages/view_post_page.dart';

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
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: List.generate(posts.length, (index) {
            final postModel = posts[index];
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: PostedContentWidget(
                voidCallback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ViewPostPage(postModel: postModel),
                    ),
                  );
                },
                // image: image,
                postModel: postModel,
                width: 300,
                height: 180.h,
              ),
            );
          }),
        ),
      ),
    );
  }
}
