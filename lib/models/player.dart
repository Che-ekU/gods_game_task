class PlayerSchema {
  PlayerSchema({
    required this.name,
    required this.id,
    required this.skill,
    required this.role,
    required this.isForeigner,
  });
  final String name;
  final String id;
  final String skill;
  final String role;
  final bool isForeigner;
}
