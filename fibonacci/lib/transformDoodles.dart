List transformDoodles(List list) {
  // Create an empty list to store the uni-dimensional array
  List transformed = [];

  // Loop through the elements in the list
  for (var element in list) {
    // If the element is a list, recursively call the function to transform it
    if (element is List) {
      transformed.addAll(transformDoodles(element));
    } else {
      // If the element is not a list, add it to the transformed list
      transformed.add(element);
    }
  }

  return transformed;
}

void main() {
  List multiDimensional = [
    1,
    2,
    [3, 4],
    5,
    [
      [6, 7],
      8
    ]
  ];
  List uniDimensional = transformDoodles(multiDimensional);
  print(uniDimensional);
}
