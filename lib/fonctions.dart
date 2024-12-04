// Fonction sans retour
void bonjour(String nom) {
  print("Bonjour, $nom !");
}

// Fonction avec retour
int addition(int a, int b) {
  return a + b;
}

void main() {
  // Appels de fonction
  bonjour("laila");
  int resultat = addition(5, 7);
  print("Résultat de l'addition : $resultat");
}
