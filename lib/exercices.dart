// Factorielle
int factorielle(int n) {
  if (n <= 1) return 1;
  return n * factorielle(n - 1);
}

// Filtrage des nombres pairs
List<int> filtrerPairs(List<int> nombres) {
  return nombres.where((n) => n % 2 == 0).toList();
}

void main() {
  print("Factorielle de 5 : ${factorielle(5)}");
  print("Nombres pairs : ${filtrerPairs([1, 2, 3, 4, 5, 6])}");
}
