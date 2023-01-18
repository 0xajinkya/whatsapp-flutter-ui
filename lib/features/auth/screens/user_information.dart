import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserInformationScreen extends StatelessWidget {
  static const String routeName = '/user-information';
  const UserInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://th.bing.com/th/id/OIP.iSu2RcCcdm78xbxNDJMJSgHaEo?w=259&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
                ),
                IconButton(
                  onPressed: () {
                    print('Hello');
                  },
                  icon: const Icon(Icons.add_a_photo),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
