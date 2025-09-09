import 'package:code_exlity/Account_Setting_Page.dart';
import 'package:code_exlity/AdditionalFieldsPage.dart';
import 'package:code_exlity/AfterLogin.dart';
import 'package:code_exlity/AllowNotificationPage.dart';
import 'package:code_exlity/ApplicationsPage.dart';
import 'package:code_exlity/Authentication/Phone_number_page.dart';
import 'package:code_exlity/Authentication/Verify_otp_page.dart';
import 'package:code_exlity/Communication_SettingPage.dart';
import 'package:code_exlity/CompanyTabsPage.dart';
import 'package:code_exlity/ContactDetailPage.dart';
import 'package:code_exlity/Delete_Account_Page.dart';
import 'package:code_exlity/IdentificationCompliancePage.dart';
import 'package:code_exlity/JobDetail.dart';
import 'package:code_exlity/JobDetail_2.dart';
import 'package:code_exlity/JobDetail_3.dart';
import 'package:code_exlity/JobListingPage.dart';
import 'package:code_exlity/JobPref.dart';
import 'package:code_exlity/JobPrefUpdate.dart';
import 'package:code_exlity/LocationAvailabilityPage.dart';
import 'package:code_exlity/LocationPage.dart';
import 'package:code_exlity/LoginScreen.dart';
import 'package:code_exlity/MessagePage.dart';
import 'package:code_exlity/MorePage.dart';
//import 'package:code_exlity/OtpEnter.dart';
import 'package:code_exlity/PersonalInfo.dart';
//import 'package:code_exlity/PhoneNumberPage.dart';
import 'package:code_exlity/PrefLocationPage.dart';
import 'package:code_exlity/ProfilePage.dart';
import 'package:code_exlity/Registrationpage.dart';
import 'package:code_exlity/ReportProblemPage.dart';
import 'package:code_exlity/ResumePage.dart';
import 'package:code_exlity/SkillcertiUpdate.dart';
import 'package:code_exlity/SkillsCertificationsPage.dart';
import 'package:code_exlity/Welcomepage.dart';
import 'package:code_exlity/WorkExp.dart';
import 'package:code_exlity/WorkExperUpdPage.dart';
import 'package:code_exlity/XrPortfolioApp.dart';
//import 'package:code_exlity/otp_enter.dart';
import 'package:code_exlity/personalDetailPage.dart';
import 'package:code_exlity/OTPPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Authentication/auth_gate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://jpbfontahritxttrkukj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpwYmZvbnRhaHJpdHh0dHJrdWtqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAwNDk1MTUsImV4cCI6MjA2NTYyNTUxNX0.BrrUn5JC7UM1RmPN_htdO7psYvLr-voIXAKDuDPZqxY',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Auth',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: const RegistrationPage(), // Replace with your phone number
      debugShowCheckedModeBanner: false,
    );
  }
}

/*

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:Locationpage()
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OTPLoginPage(),
  ));
}

class OTPLoginPage extends StatefulWidget {
  const OTPLoginPage({super.key});

  @override
  State<OTPLoginPage> createState() => _OTPLoginPageState();
}

class _OTPLoginPageState extends State<OTPLoginPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  String generatedOtp = '';
  bool otpSent = false;

  // Syrow credentials
  final String authKey = '443820Av0M3umYq67d6d2d2P1';
  final String dltTeId = '1707174201392394902';

  Future<void> sendOTP(String phone) async {
    final random = Random();
    generatedOtp = (100000 + random.nextInt(900000)).toString(); // 6-digit OTP
    String message = Uri.encodeComponent("Your OTP is $generatedOtp");

    final smsUrl =
        "https://smn.syrow.com/api/sendhttp.php?authkey=$authKey&mobiles=$phone&message=$message&sender=CDGRES&route=4&country=0&DLT_TE_ID=$dltTeId";

    final response = await http.get(Uri.parse(smsUrl));

    if (response.statusCode == 200) {
      setState(() {
        otpSent = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP sent successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send OTP')),
      );
    }
  }

  void verifyOTP() {
    if (otpController.text == generatedOtp) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP Verified Successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Incorrect OTP')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login with OTP')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Enter Phone Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                sendOTP(phoneController.text.trim());
              },
              child: const Text('Send OTP'),
            ),
            if (otpSent) ...[
              const SizedBox(height: 20),
              TextField(
                controller: otpController,
                decoration: const InputDecoration(
                  labelText: 'Enter OTP',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: verifyOTP,
                child: const Text('Verify OTP'),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

 */

 */
