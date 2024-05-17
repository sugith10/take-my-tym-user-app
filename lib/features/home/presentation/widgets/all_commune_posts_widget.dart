import 'package:flutter/widgets.dart';

import '../../../../core/model/app_post_model.dart';
import '../../../../core/widgets/home_padding.dart';
import '../../../../core/widgets/post_card.dart';
import '../../../view_post/presentation/pages/view_post_page.dart';

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
            final PostModel postModel =
                posts[index];
            return PostedContentWidget(
              voidCallback: () {
                Navigator.push(
                    context,
                    ViewPostPage.route(
                        postModel: postModel));
              },
              postModel: postModel,
              width: double.infinity,
            );
          },
        ),
      ),
    );
  }
}