import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/bloc/app_user_bloc/app_user_bloc.dart';
import 'package:take_my_tym/core/navigation/screen_transitions/bottom_to_top.dart';
import 'package:take_my_tym/core/widgets/app_bar/close_app_bar.dart';
import 'package:take_my_tym/core/widgets/app_snack_bar.dart';
import 'package:take_my_tym/core/widgets/loading_dialog.dart';
import 'package:take_my_tym/core/widgets/success_widget/success_page.dart';

import '../bloc/payment_bloc/payment_bloc.dart';
import '../bloc/wallet_bloc/wallet_bloc.dart';
import '../util/wallet_action_type.dart';
import '../widgets/feedback_text_field.dart';
import '../widgets/pay_button.dart';
import '../widgets/payment_textfield.dart';
import '../widgets/wallet_message.dart';

class PaymentPage extends StatefulWidget {
  final WalletAction type;
  final double? amount;
  const PaymentPage({required this.type, this.amount, super.key});

  static route({required WalletAction type, double? amount}) =>
      bottomToTop(PaymentPage(type: type, amount: amount));

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final PaymentBloc _paymentBloc = PaymentBloc();
  final TextEditingController _paymentCntrl = TextEditingController();
  late final String uid;
  late final bool readOnly;
  @override
  void initState() {
    super.initState();
    uid = context.read<AppUserBloc>().userModel!.uid;

    if (widget.amount != null) {
      _paymentCntrl.text = widget.amount.toString();
      readOnly = true;
    } else {
      readOnly = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _paymentCntrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WalletBloc, WalletState>(
          listener: (context, state) {
            if (state is WalletLoadedState &&
                widget.type != WalletAction.transfer) {
              Navigator.push(context, SuccessPage.route(pop: true));
            }
            if (state is WalletLoadedState &&
                widget.type == WalletAction.transfer) {
              Navigator.pop(context);
            }
            if (state is WalletLoadingState) {
              LoadingDialog().show(context);
            }
            if (state is WalletErrorState) {
              AppSnackBar.failSnackBar(context: context);
            }
            if (state is WalletTransferSuccessState) {
              Navigator.pop(context);
            }
          },
        ),
        BlocListener(
          bloc: _paymentBloc,
          listener: (context, state) {
            if (state is PaymentFailState) {
              AppSnackBar.failSnackBar(context: context);
            }
            if (state is PaymentSuccessState) {
              context.read<WalletBloc>().add(
                    WalletTopUpEvent(uid: uid, amount: state.amount),
                  );
            }
            if (state is PaymentLoadingState) {
              LoadingDialog().show(context);
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: const CloseAppBar(),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const Spacer(flex: 1),
              SizedBox(height: 20.h),
              WalletMessage(
                walletAction: widget.type,
              ),
              SizedBox(height: 20.h),
              const Spacer(flex: 1),
              PaymentTextField(controller: _paymentCntrl, readOnly: readOnly),
              SizedBox(height: 20.h),
              const FeedbackTextField(),
              const Spacer(flex: 4),
            ],
          ),
        ),
        bottomNavigationBar: PayButton(
          callback: () {
            FocusManager.instance.primaryFocus?.unfocus();
            if (widget.type == WalletAction.topUp) {
              _paymentBloc.add(PaymentTopUpEvent(amount: _paymentCntrl.text));
            } else if (widget.type == WalletAction.widthdraw) {
              context.read<WalletBloc>().add(
                  WalletWithdrawEvent(uid: uid, amount: _paymentCntrl.text));
            } else if (widget.type == WalletAction.transfer) {
              context.read<WalletBloc>().add(
                  WalletTransferEvent(uid: uid, amount: _paymentCntrl.text));
            }
          },
          type: widget.type,
        ),
      ),
    );
  }
}
