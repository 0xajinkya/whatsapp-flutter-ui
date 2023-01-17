import 'package:country_picker/country_picker.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/utils/utils.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
  }

  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();

    if(country != null && phoneNumber.isNotEmpty){
      ref.read(authControllerProvider).signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
    } else {
      showSnackBar(context: context, content: 'Fill Out All The Fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your phone number'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text('Whatsapp will now verify your phone number'),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: pickCountry, child: const Text('Pick Country')),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    country != null
                        ? Text('+${country!.phoneCode}')
                        : const Text(''),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: size.width * 0.7,
                      child: TextField(
                        controller: phoneController,
                        decoration:
                            const InputDecoration(hintText: 'phone number'),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              width: size.width * 0.4,
              child: CustomButton(
                  text: 'Next', onPressed: sendPhoneNumber
            ),
            ),
          ],
        ),
      ),
    );
  }
}
