import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaonic/generated/l10n.dart';
import 'package:kaonic/routes.dart';
import 'package:kaonic/service/user_service.dart';
import 'package:kaonic/src/widgets/solid_button.dart';
import 'package:kaonic/theme/assets.dart';
import 'package:kaonic/theme/text_styles.dart';
import 'package:kaonic/theme/theme.dart';
import 'package:permission_handler/permission_handler.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _enabled = true;

  Future<void> requestMicrophonePermission() async {
    var status = await Permission.microphone.status;

    if (!status.isGranted) {
      // Request permission
      status = await Permission.microphone.request();
    }

    if (status.isGranted) {
      // Microphone permission granted, proceed with audio recording
      print("Microphone permission granted!");
    } else if (status.isDenied) {
      // Permission was denied
      print("Microphone permission denied.");
    } else if (status.isPermanentlyDenied) {
      // Permission is permanently denied, open app settings
      print(
          "Microphone permission is permanently denied, please open settings.");
      openAppSettings();
    }
  }

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();

    Future.delayed(const Duration(milliseconds: 3550), () {
      if (context.read<UserService>().checkUserSignedIn() != null) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(Routes.home, (_) => false);
      }
      setState(() {
        _enabled = true;
      });
    });

    requestMicrophonePermission();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          Column(
            spacing: 10,
            children: [
              Image.asset(
                Assets.favicon,
                width: 50,
              ),
              Text(
                S.of(context).volaMessenger,
                textAlign: TextAlign.center,
                style: TextStyles.text20Bold.copyWith(color: AppColors.white),
              ),
            ],
          ),
          Spacer(flex: 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SolidButton(
                  textButton: S.of(context).login,
                  onTap: () {
                    if (!_enabled) return;

                    Navigator.of(context).pushNamed(Routes.login);
                  },
                ),
                const SizedBox(height: 20),
                SolidButton(
                  textButton: S.of(context).signUp,
                  onTap: () {
                    if (!_enabled) return;

                    Navigator.of(context).pushNamed(Routes.signUp);
                  },
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
