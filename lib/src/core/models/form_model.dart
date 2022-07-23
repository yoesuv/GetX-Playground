class FormModel {
  final String? fullName;
  final String? email;

  FormModel({this.fullName, this.email});

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
      };
}
