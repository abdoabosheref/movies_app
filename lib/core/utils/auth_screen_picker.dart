import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:movies_app/features/auth/presentation/screens/login_screen.dart';
import 'package:movies_app/features/screens/main_screen/main_screen.dart';
import 'package:movies_app/features/widgets/main_loading.dart';

class AuthScreenPicker extends StatefulWidget {
  const AuthScreenPicker({super.key});

  @override
  State<AuthScreenPicker> createState() => _AuthScreenPickerState();
}

class _AuthScreenPickerState extends State<AuthScreenPicker> {
  bool _isInitialCheck = true;

  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().checkCurrentUser().then((_) {
      if (mounted) {
        setState(() {
          _isInitialCheck = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isInitialCheck) {
      return const Scaffold(
        body: MainLoading(),
      );
    }

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LoginScreen();
        }
        return BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return const MainScreen();
            }
            return const LoginScreen();
          },
        );
      },
    );
  }
}