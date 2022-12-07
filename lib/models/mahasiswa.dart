part of 'models.dart';

class Mahasiswa extends Equatable {
  final String? id;
  final String? name;
  final String? nim;
  final int? umur;
  final String? createdAt;
  final String? updatedAt;

  const Mahasiswa({
    this.id,
    this.name,
    this.nim,
    this.umur,
    this.createdAt,
    this.updatedAt,
  });

  factory Mahasiswa.fromMap(Map<String, dynamic> data) => Mahasiswa(
        id: data['id'] as String?,
        name: data['name'] as String?,
        nim: data['nim'] as String?,
        umur: data['umur'] as int?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'nim': nim,
        'umur': umur,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Mahasiswa].
  factory Mahasiswa.fromJson(String data) {
    return Mahasiswa.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Mahasiswa] to a JSON string.
  String toJson() => json.encode(toMap());

  Mahasiswa copyWith({
    String? id,
    String? name,
    String? nim,
    int? umur,
    String? createdAt,
    String? updatedAt,
  }) {
    return Mahasiswa(
      id: id ?? this.id,
      name: name ?? this.name,
      nim: nim ?? this.nim,
      umur: umur ?? this.umur,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, nim, umur, createdAt, updatedAt];
}
