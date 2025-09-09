import 'package:code_exlity/AllowNotificationPage.dart';
import 'package:flutter/material.dart';

class Jobpref extends StatefulWidget {
  const Jobpref({super.key});

  @override
  State<Jobpref> createState() => _JobprefState();
}

class _JobprefState extends State<Jobpref> {
  String? _joiningAvailability;
  String? _accommodationRequired;
  bool fullTime = false;
  bool partTime = false;
  bool oneTime = false;

  final TextEditingController _cityController = TextEditingController(text: "Bengaluru");
  final List<String> _cities = ['Bengaluru', 'Mumbai', 'Delhi', 'Chennai', 'Kolkata', 'Hyderabad'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/wp.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Image.asset("assets/Group 1382.png", width: 280, height: 150),
              const Text(
                "Fill your Job Preferences",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF006442)),
              ),
              const SizedBox(height: 15),

              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text("Preferred Work Location *", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                ),
              ),
              const SizedBox(height: 30),

              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 40, bottom: 10),
                  child: Text(
                    "Preferred Job Shift",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: fullTime,
                          onChanged: (value) {
                            setState(() {
                              fullTime = value!;
                            });
                          },
                        ),
                        const Text("Day Shift", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                        const SizedBox(width: 30),
                        Checkbox(
                          value: partTime,
                          onChanged: (value) {
                            setState(() {
                              partTime = value!;
                            });
                          },
                        ),
                        const Text("Rotational Shifts", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: oneTime,
                          onChanged: (value) {
                            setState(() {
                              oneTime = value!;
                            });
                          },
                        ),
                        const Text("Night Shift", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ],
                ),
              ),

              // Available for Joining Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Text("Available for Joining*", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, top: 5),
                    child: Wrap(
                      spacing: 30,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio<String>(
                              value: 'Immediately',
                              groupValue: _joiningAvailability,
                              onChanged: (value) {
                                setState(() {
                                  _joiningAvailability = value;
                                });
                              },
                            ),
                            const Text('Immediately', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio<String>(
                              value: 'Within A Week',
                              groupValue: _joiningAvailability,
                              onChanged: (value) {
                                setState(() {
                                  _joiningAvailability = value;
                                });
                              },
                            ),
                            const Text('Within A Week', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio<String>(
                              value: 'Within A Month',
                              groupValue: _joiningAvailability,
                              onChanged: (value) {
                                setState(() {
                                  _joiningAvailability = value;
                                });
                              },
                            ),
                            const Text('Within A Month', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),

              // Accommodation Required Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Text("Accommodation Required", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 40),
                      Radio<String>(
                        value: 'Yes',
                        groupValue: _accommodationRequired,
                        onChanged: (value) {
                          setState(() {
                            _accommodationRequired = value;
                          });
                        },
                      ),
                      const Text('Yes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                      const SizedBox(width: 40),
                      Radio<String>(
                        value: 'No',
                        groupValue: _accommodationRequired,
                        onChanged: (value) {
                          setState(() {
                            _accommodationRequired = value;
                          });
                        },
                      ),
                      const Text('No', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),

              const Spacer(),

              ElevatedButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context){return Allownotificationpage();}), );},
                child: const Text("Continue", style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006442),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(300, 60),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
