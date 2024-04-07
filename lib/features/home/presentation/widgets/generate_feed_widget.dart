import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/posted_content.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/post/presentation/pages/view_post_page.dart';

class GenerateFeedWidget extends StatelessWidget {
  final String? image;
  final String service;
  final String title;
  const GenerateFeedWidget({
    this.image,
    required this.service,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: List.generate(20, (index) {
            PostModel postModel = PostModel(
              tymType: true,
              uid: "sdhdsa",
              workType: "workType",
              title: title,
              content: "content",
              userName: "userName",
              location: "location",
              skillLevel: "skillLevel",
              price: 1400,
              postDate: DateTime(2024, 4, 3),
              skills: [],
            );
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
                image: image,
                postModel: postModel,
                width: 300,
              ),
            );
          }),
        ),
      ),
    );
  }
}
