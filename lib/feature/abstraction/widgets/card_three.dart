import 'package:cred_demo_application/feature/abstraction/provider/stack_provider.dart';
import 'package:flutter/material.dart';

class CardThree extends StatelessWidget {
  const CardThree({
    super.key,
    required this.stackState,
  });
  final StackState stackState;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      color: const Color.fromARGB(255, 27, 26, 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${stackState.mockDataModel?.items?[2].openState?.body?.title}',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            '${stackState.mockDataModel?.items?[2].openState?.body?.subtitle}',
            style: const TextStyle(color: Colors.white54),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Icon(
                Icons.account_balance,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${stackState.mockDataModel?.items?[2].openState?.body?.items?[0].title}\n${stackState.mockDataModel?.items?[2].openState?.body?.items?[0].subtitle}',
                style: const TextStyle(color: Colors.white70),
              ),
              const Spacer(),
              const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 20,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                border: Border.all(color: Colors.white),
              ),
              child: Text(
                '${stackState.mockDataModel?.items?[2].openState?.body?.footer}',
                style: const TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
