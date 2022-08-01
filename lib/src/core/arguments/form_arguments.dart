class FormArguments {
  final String? fullName;
  final String? email;

  FormArguments({this.fullName, this.email});

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
      };
}
