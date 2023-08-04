import 'package:flutter/material.dart';
import 'package:globalchat_flutter/notifier/chat_notifier.dart';
import 'package:globalchat_flutter/notifier/pref_notifier.dart';
import 'package:provider/provider.dart';
import '../../util/constants.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var name = "";
  List<Widget> chats = [];

  void init() async {
    final username = context.read<PrefNotifier>().username;
    final avatarId = context.read<PrefNotifier>().avatarId;

    context.watch<ChatNotifier>().init(username, avatarId);
    chats.clear();
    context.read<ChatNotifier>().users.forEach((element) {
      chats.add(Text(element.username));
    });
  }

  @override
  Widget build(BuildContext context) {
    init();
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
          child: ListView(children: chats),
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
