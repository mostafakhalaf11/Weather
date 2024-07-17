// import 'package:flutter/material.dart';
//
// class SearchBox extends StatefulWidget {
//   const SearchBox({super.key});
//
//   @override
//   State<SearchBox> createState() => _SearchBoxState();
// }
//
// class _SearchBoxState extends State<SearchBox> {
//   String _query = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: TextField(
//           onChanged: (text) {
//             setState(() {
//               _query = text;
//             });
//             // Perform search or filtering based on _query here
//           },
//           decoration: InputDecoration(
//             hintText: 'Search...',
//             prefixIcon: const Icon(Icons.search),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(25.0),
//               borderSide: const BorderSide(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
