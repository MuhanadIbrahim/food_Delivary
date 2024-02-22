// import 'package:connectivity_wrapper/connectivity_wrapper.dart';
// import 'package:flutter/material.dart';

// class NetworkStatusWidget extends StatelessWidget {
//   final Widget child; // The widget to be wrapped

//   const NetworkStatusWidget({required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return ConnectivityWidgetWrapper(
//       child: child,
//       disableInteraction: true,
//       height: 80,
//       builder: (context, isOnline, isInitialLoading) {
//         if (isOnline) {
//           return child; // No need for a snackbar if online
//         } else if (isInitialLoading) {
//           return child; // No need for a snackbar during initial loading
//         } else {
//           // Show snackbar for offline status
//           return Stack(
//             children: [
//               child,
//               SnackBar(
//                 backgroundColor: Colors.redAccent, // Customize as needed
//                 content: Text(
//                   'No internet connection. Please check your network and try again.',
//                   style: TextStyle(color: Colors.white), // Customize as needed
//                 ),
               
//               ),
//             ],
//           );
//         }
//       },
//     );
//   }
// }
