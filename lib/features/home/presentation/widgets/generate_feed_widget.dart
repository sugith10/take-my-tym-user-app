import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/model/app_post_model.dart';
import '../../../../core/const/app_padding.dart';
import '../../../../core/route/route_name/app_route_name.dart';
import '../../../../core/widgets/post_card.dart';

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
        padding: const EdgeInsets.only(right: AppPading.homePadding),
        child: Row(
          children: List.generate(posts.length, (index) {
            final postModel = posts[index];
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 180.h,
                ),
                child: PostCard(
                  voidCallback: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.viewPost,
                      arguments: postModel,
                    );
                  },
                  postModel: postModel,
                  width: MediaQuery.of(context).size.width / 1.2,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
