import 'package:flutter/material.dart';

import '../views/search_view.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'There is no weather.',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const Text(
              '      Start searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // backgroundColor: Colors.blue, // Background color
                // foregroundColor: Colors.white, // Text color
                // elevation: 5, // Elevation (shadow)
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 15), // Padding
                textStyle: const TextStyle(fontSize: 16), // Text style
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const SearchView();
                }));
              },
              child: const Icon(
                Icons.search,
                size: 32,
              ),
            )
          ],
        ),
      ),
    );
  }
}
