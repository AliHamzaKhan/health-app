enum UserTypeEnum {
  Doctor,
  Patient
}

int getUserTypeIdFromEnum(UserTypeEnum type) {
  switch (type) {
    case UserTypeEnum.Doctor:
      return 3;
    case UserTypeEnum.Patient:
      return 5;
    default:
      throw Exception('Invalid UserTypeEnum');
  }
}

String getUserTypeNameFromId(int id) {
  switch (id) {
    case 3:
      return UserTypeEnum.Doctor.name;
    case 5:
      return UserTypeEnum.Patient.name;
    default:
      return '';
  }
}

UserTypeEnum convertUserTypeNameToEnum(String name) {
  switch (name) {
    case 'Doctor':
      return UserTypeEnum.Doctor;
    case 'Patient':
      return UserTypeEnum.Patient;
    default:
      throw Exception('Invalid user type name');
  }
}