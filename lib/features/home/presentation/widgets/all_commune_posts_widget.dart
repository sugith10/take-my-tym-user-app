import 'package:flutter/widgets.dart';
import 'package:take_my_tym/core/route/route_name/app_route_name.dart';

import '../../../../core/model/app_post_model.dart';
import '../../../../core/widgets/home_padding.dart';
import '../../../../core/widgets/post_card.dart';

class AllCommunePostsWidget extends StatelessWidget {
  final List<PostModel> posts;
  const AllCommunePostsWidget({
    required this.posts,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomePadding(
      child: Column(
        children: List.generate(
          posts.length,
          (index) {
            final PostModel postModel = posts[index];
            return PostCard(
              voidCallback: () {
                Navigator.pushNamed(
                  context,
                  RouteName.viewPost,
                  arguments: postModel,
                );
              },
              postModel: postModel,
              width: double.infinity,
              constraints: false,
            );
          },
        ),
      ),
    );
  }
}
