import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/widgets/action_button.dart';
import 'package:take_my_tym/core/widgets/back_navigation_button.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/features/post/presentation/bloc/create_post_bloc.dart';

class CreatePostSecondPage extends StatelessWidget {
  const CreatePostSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        actions: [
          ActionButton(
            voidCallback: () {},
            action: 'Next',
          ),
        ],
      ),
      body: BlocListener<CreatePostBloc, CreatePostState>(
        listener: (context, state) {},
        child: HomePadding(child: CustomScrollView(
          slivers: [ 
            SliverFillRemaining()
          ],
        )),
      ),
    );
  }
}
