import 'package:amwali/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileViw extends StatelessWidget {
  const ProfileViw({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: ProfileViewBody()));
  }
}
