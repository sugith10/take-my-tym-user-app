import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/model/app_post_model.dart';
import '../../../../core/navigation/screen_transitions/bottom_to_top.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/success_widget/success_page.dart';
import '../bloc/get_offer_bloc/get_proposal_bloc.dart';
import '../bloc/proposal_submit_bloc/submit_proposal_bloc.dart';
import '../widgets/animated_dot_widget.dart';
import '../../../../core/widgets/contct_form.dart';
import '../widgets/proposel_time_line.dart';
import '../widgets/submit_proposel_app_bar.dart';

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
  final SubmitProposalBloc submitProposalBloc = SubmitProposalBloc();
  late PageController _pageController;
  int index = 0;
  late final String userId;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    userId = context.read<AppUserBloc>().userModel!.uid;
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
      bloc: submitProposalBloc,
      listener: (context, state) {
        if (state is SubmitProposalErrorState) {
          AppSnackBar.failSnackBar(context: context, error: state.error);
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
          context.read<GetProposalBloc>().add(ProposalGetEvent(uid: userId));
          Navigator.push(context, SuccessPage.route(pop: true));
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SubmitPageAppBar(
                submitProposalBloc: submitProposalBloc,
                callback: () {
                  _navigateToNextPage();
                },
              ),
              SliverToBoxAdapter(
                child: BlocBuilder(
                  bloc: submitProposalBloc,
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
                    submitProposalBloc
                        .add(SubmitProposalPagEvent(index: value));
                  },
                  scrollBehavior: const ScrollBehavior(),
                  itemBuilder: (context, value) {
                    if (value == 0) {
                      return const ProposelTimeLine();
                    } else {
                      return ContactForm(
                        title: "Why hire you?",
                        subtitle: "Tell the hirer why you're a good fit.",
                        note:
                            "Before commit with any contract make sure you reachout contracter and verified the source.",
                        callback: () {
                          submitProposalBloc.add(
                            ProposalSubmitEvent(
                              uid: userId,
                              postModel: widget.postModel,
                              message: _msgCntrl.text,
                            ),
                          );
                        },
                        controller: _msgCntrl,
                        focusNode: _focusNode,
                        child: BlocBuilder(
                          bloc: submitProposalBloc,
                          builder: (context, state) {
                            if (state is SubmitProposalLoadingState) {
                              return const CircularProgressIndicator.adaptive();
                            }
                            return const Text("Submit");
                          },
                        ),
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
