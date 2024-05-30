import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/model/app_post_model.dart';
import '../../../../core/route/route_name/app_route_name.dart';
import '../../../../core/widgets/home_padding.dart';
import '../../../../core/widgets/post_card.dart';
import '../../../../core/widgets/shimmer_effect.dart';
import '../../../view_post/presentation/bloc/read_post_bloc/read_post_bloc.dart';

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
          return _PostsBuilder(postModelList: state.buyTymPostModel);
        }
        if (state is GotSellTymPostsState) {
          return _PostsBuilder(postModelList: state.sellTymPostModels);
        }
        if (state is UserPostError) {
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
  final List<PostModel> postModelList;
  const _PostsBuilder({
    required this.postModelList,
  });

  @override
  Widget build(BuildContext context) {
    return HomePadding(
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: postModelList.length,
        itemBuilder: (context, index) {
          final postModel = postModelList[index];
          return PostCard(
            postModel: postModel,
            voidCallback: () {
              Navigator.pushNamed(
                context,
                RouteName.viewPost,
                arguments: postModel,
              );
            },
            width: MediaQuery.of(context).size.width,
            constraints: false,
          );
        },
      ),
    );
  }
}
