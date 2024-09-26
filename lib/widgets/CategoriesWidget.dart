// import 'package:flutter/material.dart';

// class CategoriesWidget extends StatelessWidget {
//   const CategoriesWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           for (int i = 1; i < 5; i++)
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 10),
//               padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset(
//                     'images/$i.jpeg',
//                     width: 40,
//                     height: 40,
//                   ),
//                   const Text(
//                     'Sepatu',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 17,
//                         color: Color(0xFFEF3506)),
//                   )
//                 ],
//               ),
//             )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar nama kategori yang berbeda
    List<String> categories = ["Sepatu", "Fashion", "Elektronik", "Tas"];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < categories.length; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'images/${i+1}.jpeg',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    categories[i],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color(0xFF000000)),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
