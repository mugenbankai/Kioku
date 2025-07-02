import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app.dart'; // ton fichier racine

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://eoylsfpzllbtotrwqnva.supabase.co', // ton URL Supabase
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVveWxzZnB6bGxidG90cndxbnZhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY2MDIwMTksImV4cCI6MjA2MjE3ODAxOX0.CjAtHvgpFn3J9JSz-ahxfjf6aENyfqoq_mVxRmv9ums',               // ta clé publique
  );

  runApp(const KiokuApp());
}
