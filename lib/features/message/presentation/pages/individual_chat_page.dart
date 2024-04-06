import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';

class IndividualChatPage extends StatelessWidget {
  const IndividualChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text('Chat'),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: "Message",
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          IconlyBold.image_2,
                          color: Color.fromARGB(236, 124, 123, 123),
                          size: 35,
                        ),
                      ),
                    ),
                    filled: true,
                    fillColor:
                        const Color.fromARGB(237, 53, 53, 53).withOpacity(0.5),
                  ),
                  style: Theme.of(context).textTheme.titleMedium,
                )),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(100),
                    color: MyAppDarkColor().primaryText,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      IconlyBold.send,
                      color: MyAppDarkColor().background,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
