import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/posted_content.dart';
import 'package:take_my_tym/core/widgets/shimmer_effect.dart';
import 'package:take_my_tym/features/post/data/models/post_model.dart';
import 'package:take_my_tym/features/post/presentation/bloc/user_post_bloc/user_post_bloc.dart';
import 'package:take_my_tym/features/post/presentation/pages/view_post_page.dart';

class ProfilePostsWidget extends StatelessWidget {
  const ProfilePostsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPostsBloc, UserPostsState>(
      builder: (context, state) {
        if (state is UserPostsLoadingState) {
          return const ShimmerEffectWidget();
        }

        if (state is GotBuyTymPostsState) {
          return _PostsBuilder(postModles: state.buyTymPostModel);
        }

        if (state is GotSellTymPostsState) {
          return _PostsBuilder(postModles: state.sellTymPostModels);
        }

        return const SizedBox(
          child: Text("no data"),
        );
      },
    );
  }
}

class _PostsBuilder extends StatelessWidget {
  final List<PostModel> postModles;
  const _PostsBuilder({
    required this.postModles,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: postModles.length,
      itemBuilder: (context, index) {
        final model = postModles[index];
        return HomePadding(
          child: PostedContentWidget(
            postModel: model,
            voidCallback: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewPostPage(
                    postModel: model,
                  ),
                ),
              );
            },
            width: MediaQuery.of(context).size.width,
          ),
        );
      },
    );
  }
}
