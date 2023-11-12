class UserData{
  final String userName;
  final List<dynamic> roles;
  UserData({
    required this.userName,
    required this.roles,
  });
  
  @override
  String toString() => 'PhotoItemDTO(userName: $userName, roles: $roles)';
}
