import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/view_model/user_view_model.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios'),
      ),
      body: FutureBuilder(
        future: userViewModel.fetchUsers(),
        builder: (context, value) {
          if (value.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (value.hasError) {
            return const Center(child: Text('Error al cargar usuarios'));
          } else {
            return ListView.builder(
              itemCount: userViewModel.users.length,
              itemBuilder: (context, index) {
                final user = userViewModel.users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            );
          }
        },
      ),
    );
  }
}
