// Classe Personne
class Personne {
  String nom;
  int age;

  Personne(this.nom, this.age);

  // Getters et Setters
  String get getNom => nom;
  set setNom(String nouveauNom) => nom = nouveauNom;

  int get getAge => age;
  set setAge(int nouvelAge) => age = nouvelAge;
}

// Classe Étudiant
class Etudiant extends Personne {
  String classe;

  Etudiant(String nom, int age, this.classe) : super(nom, age);
}

void main() {
  // Objet Personne
  Personne personne1 = Personne("VotreNom", 20);
  print("Nom : ${personne1.getNom}, Âge : ${personne1.getAge}");

  // Modification via setters
  personne1.setNom = "NomModifié";
  print("Nom modifié : ${personne1.getNom}");

  // Objet Étudiant
  Etudiant etudiant1 = Etudiant("EtudiantNom", 20, "DFE4");
  print("Étudiant : Nom=${etudiant1.nom}, Classe=${etudiant1.classe}");
}
