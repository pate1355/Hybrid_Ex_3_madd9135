import 'dart:convert';

class Students {
  List<Map<String, String>> people;

  // Constructor
  Students(this.people);

  // Sort method
  void sort(String field) {
    people.sort((a, b) => a[field]!.compareTo(b[field]!));
  }

  // Output method
  void output() {
    for (var person in people) {
      print(person);
    }
  }

  // Plus Method
  void plus(Map<String, String> person) {
    people.add(person);
  }

  // Remove Method
  void remove(String field) {
    people.removeWhere((person) => person['first'] == field);
  }
}

void main() {
  String json = '''
  [
    {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
    {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';

  List<Map<String, String>> people = List<Map<String, String>>.from(
      (jsonDecode(json) as List).map((item) => Map<String, String>.from(item)));

  Students students = Students(people);

  // Call output method
  print('Original List:');
  students.output();

  // Call sort method
  print('\nSorted by last name:');
  students.sort('last');
  students.output();

  // Call plus method
  print('\nAfter adding a new person:');
  students
      .plus({"first": "John", "last": "Doe", "email": "johndoe@example.com"});
  students.output();

  // Call remove method
  print('\nAfter removing Steve:');
  students.remove('Steve');
  students.output();
}
