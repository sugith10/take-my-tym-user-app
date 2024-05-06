import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/bloc/app_user_bloc/app_user_bloc.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/core/navigation/screen_transitions/bottom_to_top.dart';
import 'package:take_my_tym/core/widgets/action_button.dart';
import 'package:take_my_tym/core/widgets/app_snack_bar.dart';
import 'package:take_my_tym/core/widgets/loading_dialog.dart';
import 'package:take_my_tym/features/proposals/presentation/bloc/submit_proposal_bloc/submit_proposal_bloc.dart';
import 'package:take_my_tym/features/proposals/presentation/widgets/proposal_message.dart';
import 'package:take_my_tym/features/proposals/presentation/widgets/proposel_time_line.dart';
import 'package:take_my_tym/features/proposals/presentation/widgets/animated_dot_widget.dart';

class SubmitProposelPage extends StatefulWidget {
  final PostModel postModel;
  const SubmitProposelPage({required this.postModel, super.key});

  static route({required PostModel postModel}) =>
      bottomToTop(SubmitProposelPage(postModel: postModel));

  @override
  State<SubmitProposelPage> createState() => _SubmitProposelPageState();
}

class _SubmitProposelPageState extends State<SubmitProposelPage> {
  final TextEditingController _msgCntrl = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final SubmitProposalBloc _SubmitProposalBloc = SubmitProposalBloc();
  late PageController _pageController;
  int index = 0;
  late final String userId;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    userId = context.read<AppUserBloc>().appUserModel!.uid;
  }

  @override
  void dispose() {
    _msgCntrl.dispose();
    _focusNode.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToNextPage() {
    if (_pageController.page != null) {
      _pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _SubmitProposalBloc,
      listener: (context, state) {
        if (state is SubmitProposalErrorState) {
          // LoadingDialog.hide(context);
          AppSnackBar.failSnackBar(
            context: context,
            error: state.error,
          );
        }
        if (state is SubmitProposalPageState) {
          if (state.pageNumber == 0) {
            index = state.pageNumber;
            _focusNode.unfocus();
          } else if (state.pageNumber == 1) {
            index = state.pageNumber;
            _focusNode.requestFocus();
          }
        }

        if (state is SubmitProposalSuccessState) {
          Navigator.pop(context);
          AppSnackBar().successSnackBar(
            context: context,
            title: "Successfully Submitted",
            message: "Loram Lispsum Loram Lispsum Loram Lispsum Loram Lispsum ",
          );
        }

        if (state is SubmitProposalLoadingState) {
          // LoadingDialog().show(context);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(IconlyLight.arrow_down_2),
                ),
                actions: [
                  BlocBuilder(
                    bloc: _SubmitProposalBloc,
                    builder: (context, state) {
                      if (state is SubmitProposalPageState) {
                        if (state.pageNumber == 0) {
                          return ActionButton(
                              action: 'Next',
                              callback: () {
                                _navigateToNextPage();
                              });
                        }
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: BlocBuilder(
                  bloc: _SubmitProposalBloc,
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          2,
                          (value) => Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                            ),
                            child: AnimatedDot(isActive: value == index),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverFillRemaining(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 2,
                  onPageChanged: (value) {
                    _SubmitProposalBloc.add(
                        SubmitProposalPagEvent(index: value));
                  },
                  scrollBehavior: const ScrollBehavior(),
                  itemBuilder: (context, value) {
                    if (value == 0) {
                      return const ProposelTimeLine();
                    } else {
                      return ProposalMessage(
                        callback: () {
                          _SubmitProposalBloc.add(
                            ProposalSubmitEvent(
                              uid: userId,
                              postModel: widget.postModel,
                              message: _msgCntrl.text,
                            ),
                          );
                        },
                        controller: _msgCntrl,
                        focusNode: _focusNode,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
