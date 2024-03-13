import 'package:flutter/material.dart';
import 'package:take_my_tym/features/auth/data/models/auth_user.dart';
import 'package:take_my_tym/features/home/widget/custom_toggle.dart';

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

    if (widget.user.email != null) {
      name = widget.user.email!;
    } else {
      name = "sugith";
    }
  }

  @override
  Widget build(BuildContext context) {
    print('on homepage');
    print(widget.user);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar.large(
            floating: true,
            automaticallyImplyLeading: false,
            leading:
                IconButton(onPressed: () {}, icon: Icon(Icons.density_medium)),
            title: Column(
              children: [
                Text(
                  'Hi, Sugith...',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                // CustomToggle(onChanged: (value){},value: true,)
              ],
            ),
          )
        ],
      ),
      // bottomNavigationBar: ,
    );
  }
}
