import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/view/user_list_screen.dart';
import 'package:state_provider/view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserViewModel(),
      child: const MaterialApp(
        title: 'MVVM Provider Example',
        home: UserListScreen(),
      ),
    );
  }
}
