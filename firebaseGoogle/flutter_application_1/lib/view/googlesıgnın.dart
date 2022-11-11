import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/service/google_signin.dart';

class GoogleSignIm extends StatefulWidget {
  const GoogleSignIm({super.key});

  @override
  State<GoogleSignIm> createState() => _GoogleSignImState();
}

class _GoogleSignImState extends State<GoogleSignIm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app),
        onPressed: () async {
          await GoogleSignHelper.instance.signOut();
        },
      ),
      appBar: AppBar(),
      body: Center(
        child: FloatingActionButton.extended(
          backgroundColor: Colors.green,
          onPressed: () async {
            var data = await GoogleSignHelper.instance.signIn();
            if (data != null) {
              var userData =
                  await GoogleSignHelper.instance.firebaseSignin();

              //print(userData?.accessToken);
              //print(userData?.idToken);
              ///////////////////20.26////////////////////
            }
          },
          label: const Text('Google Login'),
          icon: Icon(Icons.outbond_outlined),
        ),
      ),
    );
  }
}
