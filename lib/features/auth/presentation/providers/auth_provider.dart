import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authNotifierProvider = StreamProvider((ref) {
  return Supabase.instance.client.auth.onAuthStateChange
   .map((data) => data.session?.user);
});