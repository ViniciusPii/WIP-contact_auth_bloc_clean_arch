import 'package:contact_auth_bloc/src/domain/entities/contact_entity.dart';

extension ContactEntityAdapter on ContactEntity {
  static ContactEntity fromMap(Map<String, dynamic> map) {
    return ContactEntity(
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'phoneNumber': phoneNumber});

    return result;
  }
}
