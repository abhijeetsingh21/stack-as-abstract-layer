import 'package:cred_demo_application/feature/abstraction/provider/stack_provider.dart';
import 'package:flutter/material.dart';

class CardTwo extends StatelessWidget {
  const CardTwo({
    super.key,
    required this.stackState,
  });
  final StackState stackState;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Text(
                '${stackState.mockDataModel?.items?[1].openState?.body?.title}',
                style: const TextStyle(color: Colors.white70, fontSize: 20),
              ),
              const SizedBox(height: 15),
              Text(
                '${stackState.mockDataModel?.items?[1].openState?.body?.subtitle}',
                style: const TextStyle(
                  color: Colors.white54,
                ),
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    stackState.mockDataModel?.items?[1].openState
                          ?.body?.items?.length ?? 0,
                    (index) {
                      final data = stackState.mockDataModel?.items?[1].openState
                          ?.body?.items?[index];
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color:index == 0
                              ? const Color.fromARGB(255, 116, 77, 77).withOpacity(0.8)
                              : index == 1
                                  ? const Color.fromARGB(255, 90, 87, 87).withOpacity(0.8)
                                  : Colors.grey.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: index == 0
                              ? const Color.fromARGB(255, 116, 77, 77)
                              : index == 1
                                  ? const Color.fromARGB(255, 90, 87, 87)
                                  : Colors.grey,
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${data?.emi}\nfor ${data?.duration}\n\n${data?.subtitle}',
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  border: Border.all(color: Colors.white),
                ),
                child: Text(
                  '${stackState.mockDataModel?.items?[1].openState?.body?.footer}',
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        ));
  }
}
