

List<PackageModel> packageModelList(List value) =>
    value.map((json) => PackageModel.fromJson(json)).toList();

class PackageModel {
  int packageId;
  int totalTokens;
  int validity;
  String packageName;
  String description;
  double price;
  DateTime startDate;
  DateTime endDate;
  bool isActive;
  int userTypeId;
  DateTime createdDate;

  PackageModel({
    required this.packageId,
    required this.totalTokens,
    required this.validity,
    required this.packageName,
    required this.description,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.isActive,
    required this.userTypeId,
    required this.createdDate,
  });

  // Factory method for creating a PackageModel from JSON (optional)
  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      packageId: json['package_id'],
      totalTokens: json['total_tokens'],
      validity: json['validity'],
      packageName: json['package_name'],
      description: json['description'] ?? '',
      // Default to empty if null
      price: json['price']?.toDouble() ?? 0.0,
      // Default to 0.0 if null
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      isActive: json['is_active'] ?? true,
      // Default to true if null
      userTypeId: json['user_type_id'],
      // Optional
      createdDate: DateTime.parse(json['created_date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'package_id': packageId,
      'total_tokens': totalTokens,
      'validity': validity,
      'package_name': packageName,
      'description': description,
      'price': price,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'is_active': isActive,
      'user_type_id': userTypeId,
      'created_date': createdDate.toIso8601String(),
    };
  }
}

List<PackageModel> dummyPackagesList = <PackageModel>[
  PackageModel(
    packageId: 1,
    totalTokens: 100000,
    validity: 7, // Valid for 1 week
    packageName: 'Weekly Basic Package',
    description: 'Access to basic health services for one week.',
    price: 9.99,
    startDate: DateTime.now(),
    endDate: DateTime.now().add(Duration(days: 7)),
    isActive: true,
    userTypeId: 1, // Assuming 1 is for Patient
    createdDate: DateTime.now(),
  ),
  PackageModel(
    packageId: 2,
    totalTokens: 100000,
    validity: 30, // Valid for 1 month
    packageName: 'Monthly Standard Package',
    description: 'Access to standard health services for one month.',
    price: 29.99,
    startDate: DateTime.now(),
    endDate: DateTime.now().add(Duration(days: 30)),
    isActive: true,
    userTypeId: 1, // Assuming 1 is for Patient
    createdDate: DateTime.now(),
  ),
  PackageModel(
    packageId: 3,
    totalTokens: 100000,
    validity: 365, // Valid for 1 year
    packageName: 'Annual Premium Package',
    description: 'Comprehensive health services for one year.',
    price: 299.99,
    startDate: DateTime.now(),
    endDate: DateTime.now().add(Duration(days: 365)),
    isActive: true,
    userTypeId: 1, // Assuming 1 is for Patient
    createdDate: DateTime.now(),
  ),
  PackageModel(
    packageId: 4,
    totalTokens: 100000,
    validity: 7, // Valid for 1 week
    packageName: 'Weekly Doctor Package',
    description: 'Access to doctor consultations for one week.',
    price: 14.99,
    startDate: DateTime.now(),
    endDate: DateTime.now().add(Duration(days: 7)),
    isActive: true,
    userTypeId: 2, // Assuming 2 is for Doctor
    createdDate: DateTime.now(),
  ),
  PackageModel(
    packageId: 5,
    totalTokens: 100000,
    validity: 30, // Valid for 1 month
    packageName: 'Monthly Doctor Package',
    description: 'Access to comprehensive doctor services for one month.',
    price: 49.99,
    startDate: DateTime.now(),
    endDate: DateTime.now().add(Duration(days: 30)),
    isActive: true,
    userTypeId: 2, // Assuming 2 is for Doctor
    createdDate: DateTime.now(),
  ),
  PackageModel(
    packageId: 6,
    totalTokens: 100000,
    validity: 365, // Valid for 1 year
    packageName: 'Annual Doctor Package',
    description: 'Full access to doctor services for one year.',
    price: 599.99,
    startDate: DateTime.now(),
    endDate: DateTime.now().add(Duration(days: 365)),
    isActive: true,
    userTypeId: 2, // Assuming 2 is for Doctor
    createdDate: DateTime.now(),
  ),
];
