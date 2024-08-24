import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/assets/app_lottie.dart';

class EmptyListWidget extends StatelessWidget {
  final String message;
  const EmptyListWidget({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DotLottieLoader.fromAsset(
              AppLottie.searchFail,
              frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                if (dotlottie != null) {
                  return Lottie.memory(dotlottie.animations.values.single,
                      repeat: false);
                } else {
                  return const Text("Not found... ");
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          Text(
            message,
            style: Theme.of(context).textTheme.labelLarge,
          )
        ],
      ),
    );
  }
}
