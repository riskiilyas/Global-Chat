import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:globalchat_flutter/util/extensions.dart';
import '../util/fetch_status.dart';
import '../util/routes.dart';
import '../util/styles.dart';
import '../widget/custom_button.dart';

class OtpCodeScreen extends StatefulWidget {
  const OtpCodeScreen({super.key});

  @override
  State<OtpCodeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OtpCodeScreen> {
  String usernameOrEmail = "";
  String password = "";
  FetchStatus status = FetchStatus.INITIAL;

  // void init() async {
  //   context.watch<LoginNotifier>();
  //   status = context.read<LoginNotifier>().status;
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     if (status == FetchStatus.SUCCESS) {
  //       var data = context.read<LoginNotifier>().loginData!;
  //       ServiceLocator.prefs.then((pref) {
  //         context.read<PrefNotifier>().addUser(data.username, data.email, password, data.avatarId, data.avatars, data.items, data.token);
  //         context.read<LoginNotifier>().init();
  //         Constants.showSnackbar(context, "Selamat datang ${data.username}!");
  //         Navigator.pushNamedAndRemoveUntil(context, Routes.HOME, (route) => false);
  //       });
  //     } else if (status == FetchStatus.ERROR) {
  //       Constants.showSnackbar(context, context.read<LoginNotifier>().error);
  //       context.read<LoginNotifier>().init();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kode OTP',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Styles.COLOR_MAIN),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Styles.COLOR_MAIN,
                  ),
                )
              ],
            ),
            Divider(
              color: Styles.COLOR_MAIN,
            ),
            const SizedBox(
              height: 48,
            ),
            Center(
              child: SizedBox(
                height: 200,
                child: Image.asset(
                  'assets/otp.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            OtpTextField(
              numberOfFields: 4,
              borderColor: Styles.COLOR_MAIN,
              focusedBorderColor: Styles.COLOR_MAIN,
              showFieldAsBox: true,
              styles: List.generate(
                  4,
                  (index) => const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24)),
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            ),
            const SizedBox(
              height: 48,
            ),
            CustomButton(
                text: "KIRIM KODE OTP",
                textColor: Colors.white,
                buttonColor: Styles.COLOR_MAIN,
                onPressed: () {
                  context.showSnackbar("Password Berhasil Diubah!");
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.WELCOME, (route) => false);
                  // context.read<LoginNotifier>()
                  //     .fetch(usernameOrEmail, password);
                }),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: status == FetchStatus.LOADING
                  ? SpinKitFadingCircle(
                      color: Styles.COLOR_MAIN,
                      size: 50.0,
                    )
                  : null,
            ),
          ],
        ),
      )),
    );
  }

// @override
// void initState() {
//   super.initState();
//   init();
// }
}
