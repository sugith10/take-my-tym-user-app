import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/posted_content.dart';
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
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: PostedContentWidget(
                voidCallback: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ViewPostPage()));
                },
                image: image,
                service: service,
                title: title,
                subtitle: _subtitle,
                width: 300,
              ),
            );
          }),
        ),
      ),
    );
  }
}

const String _subtitle =
    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.";
