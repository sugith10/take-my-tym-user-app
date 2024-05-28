import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/common_app_bar.dart';

import '../../../../core/route/page_transition/app_page_transition.dart';
import '../../../../core/widgets/contct_form.dart';

class CoustomerServicePage extends StatefulWidget {
  const CoustomerServicePage({super.key});

  static route() => leftToRight(const CoustomerServicePage());

  @override
  State<CoustomerServicePage> createState() => _CoustomerServicePageState();
}

class _CoustomerServicePageState extends State<CoustomerServicePage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(),
      body: ContactForm(
        callback: () {},
        controller: _controller,
        focusNode: _focusNode,
        title: "Lorem Ipsum",
        subtitle: "Where does it come from?",
        note:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
        child: const Text("Submit"),
      ),
    );
  }
}
