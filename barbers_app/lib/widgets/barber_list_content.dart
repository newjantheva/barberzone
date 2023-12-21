// import 'package:flutter/material.dart';

// class BarberListContent extends StatefulWidget {
//   final String text;
//   final VoidCallback? previousPage;
//   final VoidCallback? nextPage;

//   const BarberListContent({
//     super.key,
//     required this.text,
//     this.previousPage,
//     this.nextPage,
//   });

//   @override
//   State<BarberListContent> createState() => _BarberListContentState();
// }

// class _BarberListContentState extends State<BarberListContent> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         SizedBox(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: AspectRatio(
//               aspectRatio: 1,
//               child: SizedBox(
//                 child: GridView.builder(
//                   itemCount: barbers.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                   ),
//                   itemBuilder: (context, index) {
//                     var item = barbers[index];
//                     if (widget.nextPage != null) {
//                       return GestureDetector(
//                         onTap: widget.nextPage,
//                         child: GridTile(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 border: Border.all(
//                                     color: Colors.grey,
//                                     width: 0.5,
//                                     style: BorderStyle.solid),
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   const SizedBox(
//                                     height: 45,
//                                     width: 45,
//                                     child: CircleAvatar(),
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     item.name,
//                                     style: const TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   const Divider(
//                                     indent: 75,
//                                     endIndent: 75,
//                                     thickness: 2,
//                                   ),
//                                   TextButton(
//                                     onPressed: () {},
//                                     child: const Text('About'),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
