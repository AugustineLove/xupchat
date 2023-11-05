class Message {
  String? name;
  int? age;

  Message({
    this.age,
    this.name,
  });

  factory Message.fromJson(Map<String, dynamic> json){
    return Message(
      name: json['name'] as String,
      age: json['age'] as int,
    );
  }
}