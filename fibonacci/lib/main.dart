

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fibonacci Calculator',
      home: FibonacciPage(),
    );
  }
}

class FibonacciPage extends StatefulWidget {
  @override
  State<FibonacciPage> createState() => _FibonacciPageState();
}

class _FibonacciPageState extends State<FibonacciPage> {
  int index = 0;

  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fibonacci Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                index = int.parse(value);
              });
            },
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              setState(() {
                result = calculateFibonacci(index);
              });
            },
            child: Text('Calculate'),
          ),
          SizedBox(height: 16.0),
          Text(
            'Fibonacci value : $result',
          ),
        ],
      ),
    );
  }
}

int calculateFibonacci(int index) {
  // Use an array to store the previous two values
  // This allows us to avoid recalculating them for each iteration
  List<int> previousValues = [0, 1];

  // If the index is 0 or 1, return the corresponding value
  if (index == 0) return 0;
  if (index == 1) return 1;

  // Initialize a counter and the result
  int counter = 2;
  int result = 0;

  // Loop through the remaining indices
  while (counter <= index) {
    // Calculate the next value by adding the previous two values
    result = previousValues[0] + previousValues[1];

    // Update the previous values array
    previousValues[0] = previousValues[1];
    previousValues[1] = result;

    // Increment the counter
    counter++;
  }

  return result;
}

/*
This application has a single page with a text field for entering the index of the Fibonacci value you want to find. When the text field's value is changed, the calculateFibonacci function is called with the entered index as an argument.

The calculateFibonacci function uses an iterative approach to calculate the Fibonacci value at the given index. It uses an array to store the previous two values, which allows it to avoid recalculating them for each iteration. This makes the function more performant at scale, as the time complexity is O(n) rather than O(2^n) for a recursive approach.

The function first checks if the index is 0 or 1 and returns the corresponding value if it is. It then initializes a counter and the result, and enters a loop that iterates through the remaining indices. For each iteration, it calculates the next value by adding the previous two values, updates the previous values array, and increments the counter. Finally, it returns the result.

This implementation should be able to handle larger numbers without slowing down exponentially. However, it is important to note that the maximum value that can be accurately calculated will depend on the size of the int data type, which may vary depending on the platform.
 */