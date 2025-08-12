import 'dart:io';

class Player {
  String name;
  String bio;
  String email;
  File? photo;

  Player({
    required this.name,
    required this.bio,
    required this.email,
    this.photo,
  });
}

// Team data model updated to include all new fields from the dialog
class Team {
  String teamName;
  // String teamType;
  File? teamLogo;
  String email;
  String teamManager;
  String managerContact;
  List<Player> players;

  Team({
    required this.teamName,
    this.teamLogo,
    // required this.teamType,
    required this.email,
    required this.teamManager,
    required this.managerContact,
    required this.players,
  });
}
