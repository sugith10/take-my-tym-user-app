import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';
import 'package:take_my_tym/core/widgets/app_bar/close_app_bar.dart';
import 'package:take_my_tym/core/widgets/app_snack_bar.dart';
import 'package:take_my_tym/core/widgets/circle_profile_picture_widget.dart';
import 'package:take_my_tym/core/widgets/submit_button.dart';
import 'package:take_my_tym/core/widgets/success_widget/success_page.dart';
import 'package:take_my_tym/features/wallet/data/datasources/remote/payment.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});
  static route() =>
      MaterialPageRoute(builder: (context) => const PaymentPage());

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Future<void> initPaymentSheet() async {
    try {
      // 1. create payment intent on the client side by calling stripe api
      final data = await createPaymentIntent(
        name: 'Sugith',
        address: 'Kodappurath House',
        pin: "432515",
        currency: 'INR',
        country: 'US',
        amount: (int.parse('1500') * 100).toString(),
        city: 'San Francisco',
        state: 'CA',
      );

      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Set to true for custom flow
          customFlow: false,
          // Main params
          merchantDisplayName: 'Flutter Stripe Store Demo',
          paymentIntentClientSecret: data['client_secret'],
          // Customer keys
          customerEphemeralKeySecret: data['ephemeralKey'],
          customerId: data['id'],
          // // Extra options
          // applePay: const PaymentSheetApplePay(
          //   merchantCountryCode: 'US',
          // ),
          // googlePay: const PaymentSheetGooglePay(
          //   merchantCountryCode: 'US',
          //   testEnv: true,
          // ),
          style: ThemeMode.dark,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CloseAppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 10.h),
            const CircleProfilePicWidget(width: 80, height: 80),
            SizedBox(height: 10.h),
            const Text("Paying Aswin P C"),
            SizedBox(height: 20.h),
            const PaymentTextField(),
            SizedBox(height: 20.h),
            const FeedbackTextField()
          ],
        ),
      ),
      bottomNavigationBar: _PayButton(
        callback: () async {
          await initPaymentSheet();
          try {
            await Stripe.instance.presentPaymentSheet();
            if (mounted) {
              Navigator.pushAndRemoveUntil(
                context,
                SuccessPage.route(),
                (route) => false,
              );
            }
          } catch (e) {
            appLogger.e(e.toString());
            AppSnackBar.failSnackBar(
              context: context,
              error: AppErrorMsg(title: "Payment failed"),
            );
          }
        },
      ),
    );
  }
}

class _PayButton extends StatelessWidget {
  final VoidCallback callback;
  const _PayButton({required this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SubmitButton(
        callback: () async {
          callback();
        },
        text: "Pay Now ➪",
        foregroundColor: AppDarkColor.instance.primaryText,
        backgroundColor: AppDarkColor.instance.success,
      ),
    );
  }
}

class PaymentTextField extends StatelessWidget {
  const PaymentTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: TextField(
        style: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(fontSize: 45.sp, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.currency_rupee_rounded,
            color: Theme.of(context).iconTheme.color,
            size: 25.sp,
          ),
          hintText: '0',
          
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontSize: 45.sp, fontWeight: FontWeight.w500),
        ),
        keyboardType: TextInputType.number,
        maxLength: 6,
      ),
    );
  }
}

class FeedbackTextField extends StatelessWidget {
  const FeedbackTextField({
    super.key,
  });
  final border = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(
      Radius.circular(18),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: TextField(
        decoration: InputDecoration(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 1.5,
          ),
          filled: true,
          fillColor: AppDarkColor.instance.fillColor,
          hintText: ' Add a note ',
          focusedBorder: border,
          enabledBorder: border,
          hintStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        minLines: 1,
        maxLines: 3,
        maxLength: 100,
        style: Theme.of(context).textTheme.labelMedium,
        keyboardType: TextInputType.text,
      ),
    );
  }
}
