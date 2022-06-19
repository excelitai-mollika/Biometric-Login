import 'package:flutter/material.dart';
import 'package:flutter_biometric/helpers/biometric_helper.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showBiometrics=false;
  bool isAuthenticated=false;

  @override
  void initState() {
    super.initState();
    isBiometricAvailable();
  }

  isBiometricAvailable()async{
    showBiometrics=await BiometricHelper().hasEnrolledBiometrics();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biometric"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(showBiometrics)
              ElevatedButton(onPressed: ()async{
                isAuthenticated=await BiometricHelper().authenticate();
                setState(() {

                });
              }, child:Text("Biometic Login")),
            if(isAuthenticated)
              const Text("Well done!,Authenticated")
          ],
        ),
      ),
    );
  }
}
