import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/features/post/presentation/bloc/delete_post_bloc/delete_post_bloc.dart';

class DletePost {
  showDletePostDialog({
    required BuildContext context,
    required PostModel postModel,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 25.h),
                Text(
                  'Delete confirmation',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Are you sure you want delete this post?',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: MyAppDarkColor().primaryTextBlur,
                      ),
                ),
                const Spacer(),
                _MessageButton(
                  action: const Text('CANCEL'),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  callback: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 12.h),
                _MessageButton(
                  action: BlocBuilder<DeletePostBloc, DeletePostState>(
                    builder: (context, state) {
                      if (state is DeletePostLoading) {
                        return const CircularProgressIndicator();
                      }
                      return const Text("Delete");
                    },
                  ),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  callback: () {
                    context.read<DeletePostBloc>().add(
                          DeletePersonalPostEvent(
                            postModel: postModel,
                          ),
                        );
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MessageButton extends StatelessWidget {
  final Widget action;
  final VoidCallback callback;
  final Color backgroundColor;
  final Color foregroundColor;
  const _MessageButton({
    required this.action,
    required this.backgroundColor,
    required this.callback,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              onPressed: () {
                callback();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(backgroundColor),
                foregroundColor: MaterialStatePropertyAll(foregroundColor),
              ),
              child: action),
        ),
      ],
    );
  }
}
