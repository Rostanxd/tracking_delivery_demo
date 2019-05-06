class User extends Object {
  String firstName;
  String lastName;
  int age;
  String role;

  User(this.firstName, this.lastName, this.age, this.role);

  User.fromJson(Map<String, dynamic> json){
    this.firstName = json['firstName'];
    this.lastName = json['lastName'];
    this.age = json['age'];
    this.role = json['role'];
  }
}