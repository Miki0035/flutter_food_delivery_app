class FUserDocument {
  final String name;
  final String email;
  final String accountId;
  final String? address1;
  final String? address2;
  final String? phoneNumber;

  FUserDocument({
    required this.name,
    required this.email,
    required this.accountId,
    this.address1,
    this.address2,
    this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "accountId": accountId,
      "address_1": address1,
      "address_2": address2,
      "phone_number": phoneNumber,
    };
  }

  static FUserDocument empty() => FUserDocument(
    name: "",
    email: "",
    accountId: '',
    address1: "",
    address2: "",
    phoneNumber: "",
  );

  factory FUserDocument.fromMap(Map<String, dynamic> value) {
    return FUserDocument(
      name: value["name"],
      email: value["email"],
      accountId: value["accountId"],
      address1: value["address_1"] ?? "",
      address2: value["address_2"] ?? "",
      phoneNumber: value["phone_number"],
    );
  }
}
