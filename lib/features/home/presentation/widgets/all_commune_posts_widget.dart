import 'package:flutter/widgets.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/posted_content.dart';
import 'package:take_my_tym/features/post/presentation/pages/view_post_page.dart';

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
