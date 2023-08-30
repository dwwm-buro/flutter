String find() {
  print('SLOW');
  return 'toto';
}

void main() {
  late String slow = find();
  print(slow);

  String? name = 'Fiorella';
  const int age = 3;
  bool isGirl = true;
  final now = DateTime.now();

  print('Hello $name, tu as $age ans et tu es ${isGirl ? 'une fille' : 'un garçon'}.');

  for (int i = 1; i <= 10; i++) {
    print(i);
  }

  // Fonctions
  String hello(String name, [int? age = 2]) {
    return 'Bonjour $name, tu as $age ans.';
  }

  String goodBye(String name) => 'Au revoir $name';

  print(hello('Fiorella'));
  print(hello('Fiorella', 3));
  print(goodBye('Fiorella'));

  // Paramètres nommés
  String showCar({required String brand, required String model, int? wheel = 4}) {
    return 'La voiture $brand $model a $wheel roues.';
  }

  print(showCar(brand: 'BMW', model: 'Série 1'));

  void show(Function fn, int numbers) {
    for (int i = 0; i <= numbers; i++) {
      if (fn(i)) {
        print(i);
      }
    }
  }

  show((int i) {
    return i % 2 == 0;
  }, 10); // de 0 à 10, les nombres pairs

  show((int i) {
    return i > 5;
  }, 20); // De 0 à 20, les nombres de 6 à 20

  // Les listes
  List<String> cars = ['BMW', 'Renault', 'Alfa Roméo'];
  cars.add('Ferrari');
  cars.remove('Renault');
  print(cars);

  for (String car in cars) {
    print('J\'ai un(e) $car');
  }

  // Un map
  Map<String, String> colors = {
    'red': '#ff0000',
    'blue': '#0000ff',
  };

  print(colors['blue']);

  bool active = false;

  print([
    1,
    if (active) 2,
    3,
    for (int i = 4; i <= 10; i++) i
  ]);

  print([
    for (int i in [1, 2, 3]) i * 2
  ]);

  // Les objets
  People fiorella = People(
    name: 'Fiorella',
    birthday: DateTime(2019, 12, 31)
  );
  print('${fiorella.name} a ${fiorella.birthday}');
  fiorella.present();
} // Fin du main

class People {
  String name;
  DateTime birthday;

  People({required this.name, required this.birthday});

  void present() {
    print('$name a $birthday');
  }
}
