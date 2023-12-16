class UserData {
  final String fullName;
  final String phoneNumber;
  final String email;
  final bool isPasswordComplete;
  final bool isEverythingComplete;
  const UserData({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.isPasswordComplete,
    required this.isEverythingComplete,
  });

  factory UserData.fromJsonEntry(MapEntry<String, dynamic> jsonEntry) {
    return UserData(
      fullName: jsonEntry.value["fullname"] ?? "null",
      phoneNumber: jsonEntry.key,
      email: jsonEntry.value['email'] ?? "null",
      isPasswordComplete: jsonEntry.value['passwordCompleted'] ?? false,
      isEverythingComplete: jsonEntry.value['isTestCompleted'] ?? false,
    );
  }
}
