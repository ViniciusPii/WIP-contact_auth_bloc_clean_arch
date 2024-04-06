import 'package:contact_auth_bloc/src/features/contact/domain/entities/contact_entity.dart';

extension ContactEntityAdapter on ContactEntity {
  static ContactEntity fromMap(Map<String, dynamic> data, String? id) {
    return ContactEntity(
      id: id ?? '',
      name: data['name'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'phoneNumber': phoneNumber});

    return result;
  }
}
