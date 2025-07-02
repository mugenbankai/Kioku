import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:kioku/auth_gate.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  Future<void> _logout(BuildContext context) async {
  try {
    await Supabase.instance.client.auth.signOut();

    if (!context.mounted) return;

    // Affiche le snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Déconnecté avec succès')),
    );

    // Redirection vers la page de login ou auth_gate
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const AuthGate()),
      (route) => false,
    );
  } catch (e) {
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Erreur lors de la déconnexion : $e')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          const Text(
            'Paramètres',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          // 🔴 Bouton déconnexion
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'Se déconnecter',
              style: TextStyle(color: Colors.white),
            ),
            tileColor: Colors.grey[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }
}
