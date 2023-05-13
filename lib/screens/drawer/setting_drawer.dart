import 'package:doctor_application/layout/doctor_screen.dart';
import 'package:doctor_application/screens/languages_screen.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsDrawer extends StatefulWidget {
  const SettingsDrawer({super.key});

  @override
  _SettingsDrawerState createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {
  bool lockInBackground = true;
  var phoneController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LayoutScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('common'),
            tiles: [
              SettingsTile(
                title: const Text('Language'),
                trailing: const Text('English'),
                leading: const Icon(Icons.language),
                onPressed: (buildContext) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LanguageSelectorPage()));
                },
              ),
              SettingsTile(
                  title: const Text('Environment'),
                  trailing: const Text('Production'),
                  leading: const Icon(Icons.cloud_queue)),
            ],
          ),
          // SettingsSection(
          //   title: const Text('Account'),
          //   tiles: [
          //     SettingsTile(
          //       title: TextFormField(
          //         controller: phoneController,
          //         keyboardType: TextInputType.phone,
          //         decoration: const InputDecoration(
          //           label: Text('Phone No:'),
          //         ),
          //       ),
          //       leading: const Icon(Icons.phone),
          //     ),
          //     SettingsTile(
          //       title: TextFormField(
          //         controller: phoneController,
          //         keyboardType: TextInputType.emailAddress,
          //         decoration: const InputDecoration(
          //             label: Text('Email:')
          //         ),
          //       ),
          //       leading: const Icon(Icons.email),
          //     ),
          //     SettingsTile(
          //       title: const Text('Sign out'),
          //       leading: const Icon(Icons.exit_to_app),
          //     ),
          //   ],
          // ),
          SettingsSection(
            title: const Text('Misc'),
            tiles: [
              SettingsTile(
                  title: const Text('Terms of Service'),
                  leading: const Icon(Icons.description)),
              SettingsTile(
                  title: const Text('Open source licenses'),
                  leading: const Icon(Icons.collections_bookmark)),
            ],
          )
        ],
      ),
    );
  }
}
