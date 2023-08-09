import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../util/fetch_status.dart';
import '../util/routes.dart';
import '../util/styles.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ForgotPasswordScreen> {
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
                  'Lupa Password',
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
                  'assets/imgs/forgot.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            CustomTextField(
              hint: "Masukkan Email",
              icon: Icons.email,
              callback: (_) {
                usernameOrEmail = _;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              hint: "Masukkan Password Baru",
              icon: Icons.password,
              callback: (_) {
                usernameOrEmail = _;
              },
            ),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
                text: "KIRIM",
                textColor: Colors.white,
                buttonColor: Styles.COLOR_MAIN,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.OTP_SCREEN);
                }),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Belum Punya Akun? ',
                  style: TextStyle(color: Styles.COLOR_HINT_TEXT, fontSize: 16),
                ),
                InkWell(
                  onTap: () => {
                    Navigator.of(context).pushReplacementNamed(Routes.REGISTER)
                  },
                  child: Text(
                    'Yuk Daftar!',
                    style: TextStyle(
                        color: Styles.COLOR_MAIN,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
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
