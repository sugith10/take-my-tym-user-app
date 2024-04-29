import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/core/navigation/screen_transitions/left_to_right.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/core/utils/app_padding.dart';
import 'package:take_my_tym/core/widgets/app_card.dart';
import 'package:take_my_tym/core/widgets/app_dialog.dart';
import 'package:take_my_tym/core/widgets/common_app_bar.dart';
import 'package:take_my_tym/core/widgets/home_padding.dart';
import 'package:take_my_tym/core/widgets/post_owner_info_widget.dart';
import 'package:take_my_tym/core/widgets/posted_content.dart';
import 'package:take_my_tym/core/widgets/submit_button.dart';
import 'package:take_my_tym/features/control_panel/presentation/widgets/offer_subtitle_widget.dart';

class AcceptOfferPage extends StatelessWidget {
  static route() => leftToRight(const AcceptOfferPage());
  const AcceptOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(),
      body: HomePadding(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              const OfferSubtitleWidget(title: "Proposed by"),
              SizedBox(height: 15.h),
              PostOwnerInfoWidget(
                date: Timestamp(10, 10),
                image: '',
                name: 'Javad',
              ),
              SizedBox(height: 20.h),
              PostedContentWidget(
                voidCallback: () {},
                postModel: postModel,
                width: double.infinity,
              ),
              SizedBox(height: 20.h),
              const AcceptMessage(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AcceptOfferWidget(),
    );
  }
}



class AcceptOfferWidget extends StatelessWidget {
  const AcceptOfferWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: MyAppPadding.homePadding),
        Expanded(
          child: SubmitButton(
            text: "Reject",
            backgroundColor: MyAppDarkColor.instance.danger,
            foregroundColor: MyAppDarkColor.instance.primaryText,
            callback: () {
              AppDialog.show(
                context: context,
                title: "Reject Offer",
                subtitle: "Lorem Ipsum is simply dummy text",
                action: "Reject",
                actionCall: () {},
              );
            },
          ),
        ),
        Expanded(
          child: SubmitButton(
            text: "Accept",
            backgroundColor: Colors.green,
            foregroundColor: MyAppDarkColor.instance.primaryText,
            callback: () {
              AppDialog.show(
                  context: context,
                  title: "Accept Offer",
                  subtitle: "Lorem Ipsum is simply dummy text",
                  action: "Accept",
                  actionCall: () {},
                  actionColor: Colors.green);
            },
          ),
        ),
        const SizedBox(width: MyAppPadding.homePadding),
      ],
    );
  }
}

class AcceptMessage extends StatefulWidget {
  const AcceptMessage({
    super.key,
  });

  @override
  State<AcceptMessage> createState() => _AcceptMessageState();
}

class _AcceptMessageState extends State<AcceptMessage> {
  bool _icon = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      enableFeedback: false,
      title: const Text('Message from Javad'),
      trailing: _icon
          ? const Icon(IconlyLight.arrow_up_circle)
          : const Icon(IconlyLight.arrow_down_circle),
      onExpansionChanged: (value) => setState(() {
        _icon = value;
      }),
      children: [
        AppCard(
          voidCallback: () {},
          width: double.infinity,
          child: const Text(
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages"),
        )
      ],
    );
  }
}

final postModel = PostModel(
  tymType: true,
  uid: '123456789',
  userName: 'javand',
  postDate: Timestamp(10, 10),
  workType: 'Remote',
  title: 'Lorem Ipsum is simply dummy text of the printing',
  content:
      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,",
  location: "Kozhikode",
  latitude: 134,
  longitude: 135,
  skillLevel: "Intermediate",
  price: 1500.5,
  skills: const ["Lorem", "Ipsum"],
);
