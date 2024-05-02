import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/navigation/screen_transitions/bottom_to_top.dart';
import 'package:take_my_tym/core/widgets/action_button.dart';
import 'package:take_my_tym/core/widgets/snack_bar_messenger_widget.dart';
import 'package:take_my_tym/features/checkout/presentation/bloc/proposal_bloc/proposal_bloc.dart';
import 'package:take_my_tym/features/checkout/presentation/pages/proposal_message.dart';
import 'package:take_my_tym/features/checkout/presentation/pages/proposel_time_line.dart';
import 'package:take_my_tym/features/checkout/presentation/widgets/animated_dot_widget.dart';

class SubmitProposelPage extends StatefulWidget {
  const SubmitProposelPage({super.key});

  static route() => bottomToTop(const SubmitProposelPage());

  @override
  State<SubmitProposelPage> createState() => _SubmitProposelPageState();
}

class _SubmitProposelPageState extends State<SubmitProposelPage> {
  final TextEditingController _msgCntrl = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ProposalBloc _proposalBloc = ProposalBloc();
  late PageController _pageController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
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
      bloc: _proposalBloc,
      listener: (context, state) {
        if (state is ProposalErrorState) {
          AppSnackBar.failSnackBar(
            context: context,
            error: state.error,
          );
        }
        if (state is ProposalPageState) {
          if (state.pageNumber == 0) {
            index = state.pageNumber;
            _focusNode.unfocus();
          } else if (state.pageNumber == 1) {
            index = state.pageNumber;
            _focusNode.requestFocus();
          }
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
                    bloc: _proposalBloc,
                    builder: (context, state) {
                      if (state is ProposalPageState) {
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
                  bloc: _proposalBloc,
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
                    _proposalBloc.add(ProposalPageNavEvent(index: value));
                  },
                  scrollBehavior: const ScrollBehavior(),
                  itemBuilder: (context, value) {
                    if (value == 1) {
                      return ProposalMessage(
                        proposalBloc: _proposalBloc,
                        controller: _msgCntrl,
                        focusNode: _focusNode,
                      );
                    } else {
                      return const ProposelTimeLine();
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
