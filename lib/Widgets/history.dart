import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ios_calculator/Widgets/provider.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    final resultProvider = Provider.of<Result>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              child: const Text(
                'Clear History',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                resultProvider.clearData();
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              child: const Text(
                'back',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                resultProvider.closeHistoryPage();
              },
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: resultProvider.getData()!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  resultProvider.getData()![index],
                  style: const TextStyle(color: Colors.amber),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
