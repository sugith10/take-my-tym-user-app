import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:take_my_tym/core/utils/app_colors.dart';
import 'package:take_my_tym/features/message/presentation/bloc/individual_message_bloc/individual_message_bloc.dart';

class ChatTextField extends StatefulWidget {
  final String receiverUid;
  final String receiverName;
  final String currentUid;

  final IndividualMessageBloc individualMessageBloc;
  const ChatTextField({
    required this.individualMessageBloc,
    required this.currentUid,
    required this.receiverUid,
    required this.receiverName,
    super.key,
  });

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  final AppDarkColor _appDarkColor = AppDarkColor.instance;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
                                                                                                                                         
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.text,
                 
                  maxLines: 3,
                  maxLength: 100,
                  minLines: 1                                                                                                                                     ,
                  controller: _controller,
                  textCapitalization: TextCapitalization.sentences,
            
                  decoration: InputDecoration(
                  
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: _appDarkColor.secondaryText),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: _appDarkColor.secondaryText),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    hintText: "Message",
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    filled: true,
                    fillColor: _appDarkColor.bottomBar,
                    prefix: const SizedBox(width: 10),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 5,left: 5),
                      child: _ChatIconButton(
                        callback: () {
                          widget.individualMessageBloc.add(
                            SendMessageEvent(
                              message: _controller.text,
                              currentUid: widget.currentUid,
                              receiverUid: widget.receiverUid,
                            ),
                          );
                          _controller.clear();
                        },
                        icon: IconlyBold.send,
                        darkColor: _appDarkColor,
                      ),
                    ),
                  ),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class _ChatIconButton extends StatelessWidget {
  final VoidCallback callback;
  final IconData icon;
  final AppDarkColor darkColor;
  const _ChatIconButton(
      {required this.icon, required this.callback, required this.darkColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppDarkColor.instance.secondaryText),
        borderRadius: BorderRadius.circular(100),
        color: AppDarkColor.instance.bottomBar,
      ),
      child: IconButton(
        tooltip: "Send",
        onPressed: () {
          callback();
        },
        icon: Icon(
          icon,
          size: 30,
          color: AppDarkColor.instance.primaryText,
        ),
      ),
    );
  }
}
