import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/model/app_post_model.dart';
import '../../../../core/widgets/home_padding.dart';
import '../../../../core/widgets/post_card.dart';
import '../../../../core/widgets/shimmer_effect.dart';
import '../../../view_post/presentation/bloc/read_post_bloc/read_post_bloc.dart';
import '../../../view_post/presentation/pages/view_post_page.dart';


class ProfilePostsWidget extends StatelessWidget {
  const ProfilePostsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPostsBloc, ReadPostsState>(
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
        if(state is UserPostError){
          return Column(
            children: [
              SizedBox(height: 50.h),
              Center(child: Text(state.error)),
              SizedBox(height: 50.h),
            ],
          );
        }
        return const ShimmerEffectWidget();
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
    return HomePadding(
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: postModles.length,
        itemBuilder: (context, index) {
          final model = postModles[index];
          return PostedContentWidget(
            postModel: model,
            voidCallback: () {
              Navigator.push(
                context,
                ViewPostPage.route(postModel: model),
              );
            },
            width: MediaQuery.of(context).size.width,
          );
        },
      ),
    );
  }
}