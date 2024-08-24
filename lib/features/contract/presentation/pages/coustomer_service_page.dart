import 'package:flutter/material.dart';
import 'package:take_my_tym/core/widgets/common_app_bar.dart';

import '../../../../core/widgets/contct_form.dart';

class CustomerServicePage extends StatefulWidget {
  const CustomerServicePage({super.key});

  @override
  State<CustomerServicePage> createState() => _CustomerServicePageState();
}

class _CustomerServicePageState extends State<CustomerServicePage> {
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
        title: "Register Your Complaint",
        hint: "Describe the Issue",
        note:
            "Please provide detailed information about the issue, including relevant details such as date and time. We typically resolve complaints within 24 hours, but it may take longer. \nThank you for your patience.",
        child: const Text("Submit"),
      ),
    );
  }
}
