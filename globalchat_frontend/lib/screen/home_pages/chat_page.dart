import 'package:flutter/material.dart';
import 'package:globalchat_flutter/widget/me_chat_widget.dart';
import 'package:globalchat_flutter/widget/user_chat_widget.dart';
import 'package:globalchat_flutter/widget/user_joined_widget.dart';
import 'package:provider/provider.dart';
import '../../util/constants.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var name = "";

  // void init(BuildContext context) async {
  //   context.watch<PrefNotifier>();
  //   name = context.read<PrefNotifier>().name;
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Constants.COLOR_BACKGROUND,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: RefreshIndicator(
          color: Constants.COLOR_MAIN,
          onRefresh: () {
            return Future(() => null);
            // return ServiceLocator.prefs.then((pref) {
            //   context
            //       .read<ReccomendMandorNotifier>()
            //       .fetch(pref.getString(Constants.PREF_TOKEN) ?? "");
            // });
          },
          child: ListView(
            children: const [
              SizedBox(
                height: 8,
              ),
              UserJoinedWidget(user: "riski1351"),
              UserJoinedWidget(user: "sixtyn9"),
              UserJoinedWidget(user: "gamerboiii"),
              UserJoinedWidget(user: "riski1351"),
              UserJoinedWidget(user: "sixtyn9"),
              UserJoinedWidget(user: "gamerboiii"),
              UserJoinedWidget(user: "riski1351"),
              UserJoinedWidget(user: "sixtyn9"),
              UserJoinedWidget(user: "gamerboiii"),
              UserJoinedWidget(user: "riski1351"),
              UserJoinedWidget(user: "sixtyn9"),
              UserJoinedWidget(user: "gamerboiii"),
              UserJoinedWidget(user: "riski1351"),
              UserJoinedWidget(user: "sixtyn9"),
              UserJoinedWidget(user: "gamerboiii"),
              UserJoinedWidget(user: "riski1351"),
              UserJoinedWidget(user: "sixtyn9"),
              UserJoinedWidget(user: "gamerboiii"),
            ],
          ),
        ),
      ),
    );
  }

// Widget _reccomendMandorWidget(BuildContext context) {
//   var status = context.watch<ReccomendMandorNotifier>().status;
//   if (status == FetchStatus.SUCCESS) {
//     reccomendMandor = context.watch<ReccomendMandorNotifier>().data;
//     return Column(
//       children: List.generate(
//           reccomendMandor.length,
//           (index) => MandorItem(
//                 fullname: reccomendMandor[index].name,
//                 rating: reccomendMandor[index].rating,
//                 experience: reccomendMandor[index].details.experience,
//                 rangeKuli:
//                     "${reccomendMandor[index].details.minPeople} - ${reccomendMandor[index].details.maxPeople} kuli",
//                 location: reccomendMandor[index].details.city,
//                 imgUrl: reccomendMandor[index].profileUrl,
//                 onPressed: () {
//                   context.read<DetailMandorNotifier>().init();
//                   Constants.goto(
//                       context,
//                       DetailMandorPage(
//                         id: reccomendMandor[index].id,
//                       ));
//                 },
//               )),
//     );
//   } else {
//     if (status == FetchStatus.INITIAL) {
//       ServiceLocator.prefs.then((pref) {
//         context
//             .read<ReccomendMandorNotifier>()
//             .fetch(pref.getString(Constants.PREF_TOKEN) ?? "");
//       });
//       var response = context.watch<ReccomendMandorNotifier>().data;
//       reccomendMandor = response;
//     }
//     return const SpinKitFadingCircle(
//       color: Constants.COLOR_MAIN,
//       size: 50.0,
//     );
//   }
// }
}
