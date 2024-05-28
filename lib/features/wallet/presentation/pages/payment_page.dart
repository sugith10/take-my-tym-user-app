import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/app_user_bloc/app_user_bloc.dart';
import '../../../../core/route/route_name/app_route_name.dart';
import '../../../../core/utils/app_error_msg.dart';
import '../../../../core/widgets/app_bar/close_app_bar.dart';
import '../../../../core/widgets/app_snackbar/app_snack_bar.dart';
import '../../../../core/widgets/loading_dialog.dart';
import '../../../success/presentation/model/success_page_arguments.dart';
import '../../data/models/wallet_model.dart';
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
  final WalletModel? walletModel;
  const PaymentPage(
      {this.walletModel, required this.type, this.amount, super.key});

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
            if (state is WalletLoadedState) {
              Navigator.pushNamed(context, RouteName.home,
                  arguments: SuccessPageArguments(
                      pop: true,
                      title: "Transaction Successful",
                      subtitle:
                          "Amount: ${state.walletModel.transactions.first.amount}"));
            }
            if (state is WalletTransferSuccessState) {
              Navigator.pop(context);
            }
            if (state is WalletLoadingState) {
              LoadingDialog().show(context);
            }
            if (state is WalletErrorState) {
              AppSnackBar.failSnackBar(
                context: context,
                alert: AppAlert(),
              );
            }
          },
        ),
        BlocListener(
          bloc: _paymentBloc,
          listener: (context, state) {
            if (state is PaymentFailState) {
              LoadingDialog.hide(context);
              AppSnackBar.failSnackBar(
                context: context,
                alert: AppAlert(),
              );
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
              context.read<WalletBloc>().add(WalletWithdrawEvent(
                  uid: uid,
                  amount: _paymentCntrl.text,
                  walletModel: widget.walletModel));
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
