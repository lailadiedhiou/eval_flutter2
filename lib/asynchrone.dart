import 'dart:async';

Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return "Données reçues";
}

void main() async {
  print("Chargement...");
  String data = await fetchData();
  print(data);

  // Stream
  Stream<int> stream = Stream.periodic(Duration(seconds: 1), (i) => i).take(5);
  await for (var value in stream) {
    print("Valeur : $value");
  }
}
