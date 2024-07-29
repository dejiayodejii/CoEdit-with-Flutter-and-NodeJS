// import 'package:collaborating_editing_app/controller/auth_controller.dart';
// import 'package:collaborating_editing_app/screens/detail_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   @override
//   Widget build(BuildContext context) {
//     final authNotifier = ref.watch(authProvider.notifier);

//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         drawer: const Drawer(),
//         appBar: AppBar(
//           title: const Text('CoEdit'),
//           centerTitle: true,
//           automaticallyImplyLeading: false,
//           backgroundColor: Theme.of(context).primaryColor,
//           foregroundColor: Theme.of(context).scaffoldBackgroundColor,
//           actions: [
//             GestureDetector(
//                 onTap: () {
//                   authNotifier.logout();
//                 },
//                 child: const Icon(Icons.settings))
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {},
//           child: const Icon(Icons.add),
//         ),
//         body: Column(
//           children: [
//             const TabBar(
//               // labelColor: Colors.white,
//               tabs: [
//                 Tab(text: 'My Documents'),
//                 Tab(
//                   text: 'Shared with me',
//                 ),
//               ],
//             ),
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10),
//                     child: ListView.builder(
//                         itemCount: 2,
//                         itemBuilder: (context, index) {
//                           return Column(
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               DetailScreen()));
//                                 },
//                                 child: ListTile(
//                                   leading: Text('A'),
//                                   title: Text('A new dawn'),
//                                   subtitle: Text('Last updated - March 1st'),
//                                   trailing: Icon(Icons.people),
//                                 ),
//                               ),
//                               Divider()
//                             ],
//                           );
//                         }),
//                   ),
//                   const Center(child: Text('Tab 2 Content')),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
