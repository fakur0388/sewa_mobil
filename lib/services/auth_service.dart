class AuthService {
  AuthService._();

  static String? currentUserName;

  static bool login({required String identifier, required String password}) {
    final id = identifier.trim();
    final pass = password.trim();
    if (id.isEmpty || pass.isEmpty) return false;

    currentUserName = id;
    return true;
  }

  static bool register({
    required String name,
    required String email,
    required String password,
  }) {
    final n = name.trim();
    final e = email.trim();
    final p = password.trim();
    if (n.isEmpty || e.isEmpty || p.isEmpty) return false;

    // MVP mock: langsung anggap registrasi berhasil
    currentUserName = n;
    return true;
  }

  static void logout() {
    currentUserName = null;
  }
}
