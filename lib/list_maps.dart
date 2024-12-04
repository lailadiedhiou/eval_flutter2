void main() {
  List<int> nombres = [1, 2, 3, 4];
  nombres.add(6);

  Map<String, dynamic> etudiants = {
    'nom': 'laila',
    'age': 21,
    'classe': 'DFE4'
  };

  etudiants['note'] = 85;
  print("Etudiant: $etudiants");
}
