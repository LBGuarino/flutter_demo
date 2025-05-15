class Student {
  int id;
  String firstName;
  String lastName;
  int age;
  String major;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.major,
  });

  // Convert a Student into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'major': major,
    };
  }

  // Convert a Map into a Student. This is a factory constructor.
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      age: map['age'],
      major: map['major'],
    );
  }
}
