import 'package:flutter/material.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';

class HomePage extends StatefulWidget {
  final AuthUserModel user;
  const HomePage({required this.user, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String name;
  @override
  void initState() {
    super.initState();

    if(widget.user.email != null){
      name = widget.user.email!;
    }else{
      name = "sugith";
    }
  }
  @override
  Widget build(BuildContext context) {
    print('on homepage');
     print(widget.user);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(name),
      ),

    );
  }
}
