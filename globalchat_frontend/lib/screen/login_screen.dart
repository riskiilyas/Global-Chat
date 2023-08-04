import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:globalchat_flutter/notifier/pref_notifier.dart';
import 'package:globalchat_flutter/screen/home_screen.dart';
import 'package:provider/provider.dart';

import '../notifier/login_notifier.dart';
import '../util/constants.dart';
import '../util/fetch_status.dart';
import '../util/routes.dart';
import '../util/service_locator.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginScreen> {
  String usernameOrEmail = "";
  String password = "";
  FetchStatus status = FetchStatus.INITIAL;

  void init() async {
    context.watch<LoginNotifier>();
    status = context.read<LoginNotifier>().status;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (status == FetchStatus.SUCCESS) {
        var data = context.read<LoginNotifier>().loginData!;
        ServiceLocator.prefs.then((pref) {
          context.read<PrefNotifier>().addUser(data.username, data.email, password, data.avatarId, data.avatars, data.items, data.token);
          context.read<LoginNotifier>().init();
          Constants.showSnackbar(context, "Selamat datang ${data.username}!");
          Navigator.pushNamedAndRemoveUntil(context, Routes.HOME, (route) => false);
        });
      } else if (status == FetchStatus.ERROR) {
        Constants.showSnackbar(context, context.read<LoginNotifier>().error);
        context.read<LoginNotifier>().init();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Masuk',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Constants.COLOR_MAIN),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Constants.COLOR_MAIN,
                  ),
                )
              ],
            ),
            const Divider(
              color: Constants.COLOR_MAIN,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Gunakan akun yang telah didaftarkan!',
              style: TextStyle(color: Constants.COLOR_TEXT),
            ),
            const SizedBox(
              height: 48,
            ),
            Center(
              child: SizedBox(
                height: 200,
                child: Image.asset(
                  'assets/regis.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            CustomTextField(
              hint: "Email or Username",
              icon: Icons.email,
              callback: (_) {
                usernameOrEmail = _;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              hint: "Password",
              icon: Icons.password,
              callback: (_) {
                password = _;
              },
            ),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
                text: "MASUK",
                textColor: Colors.white,
                buttonColor: Constants.COLOR_MAIN,
                onPressed: () {
                print('oiasnfiouaesfnifesja');
                          context.read<LoginNotifier>()
                          .fetch(usernameOrEmail, password);
                    }),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                const Text(
                  'Belum Punya Akun? ',
                  style: TextStyle(
                      color: Constants.COLOR_HINT_TEXT, fontSize: 16),
                ),
                InkWell(
                  onTap: () => {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.REGISTER)
                  },
                  child: const Text(
                    'Yuk Daftar!',
                    style: TextStyle(
                        color: Constants.COLOR_MAIN,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: status == FetchStatus.LOADING
                  ? const SpinKitFadingCircle(
                      color: Constants.COLOR_MAIN,
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
