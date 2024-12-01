import 'package:cred_demo_application/feature/abstraction/provider/stack_provider.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CardOne extends StatelessWidget {
  const CardOne({
    super.key,
    required this.stackState,
  });
  final StackState stackState;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stackState.mockDataModel?.items?[0].openState?.body?.title ?? '-',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white60,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            stackState.mockDataModel?.items?[0].openState?.body?.subtitle ??
                '-',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  12,
                )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: SleekCircularSlider(
                      initialValue: 50, 
                      max: 100, 
                      appearance: CircularSliderAppearance(
                        customColors: CustomSliderColors(
                          progressBarColors: [
                            Colors.blue,
                            Colors.green
                          ], 
                          trackColor: Colors.grey, 
                          shadowColor: Colors.green, 
                          shadowMaxOpacity: 0.2, 
                        ),
                        customWidths: CustomSliderWidths(
                          progressBarWidth: 12, 
                          trackWidth: 12, 
                          shadowWidth: 20, 
                        ),
                        size: 200, 
                        startAngle: 150, 
                        angleRange: 240, 
                        infoProperties: InfoProperties(
                          
                          mainLabelStyle:
                              const TextStyle(fontSize: 15, color: Colors.blue),
                          modifier: (double value) {
                            
                            return 'Credit Ammount\n        ₹ ${(value * 4878).toStringAsFixed(0)}';
                          },
                        ),
                        spinnerMode: false, 
                        animationEnabled: true, 
                      ),
                      onChange: (double value) {
                        
                        print(value);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    stackState
                            .mockDataModel?.items?[0].openState?.body?.footer ??
                        '-',
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 15,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
