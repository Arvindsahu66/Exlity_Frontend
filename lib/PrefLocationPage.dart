/*
import 'package:code_exlity/WorkExp.dart';
import 'package:flutter/material.dart';

class Preflocationpage extends StatefulWidget {
  const Preflocationpage({super.key});

  @override
  State<Preflocationpage> createState() => _PreflocationpageState();
}

class _PreflocationpageState extends State<Preflocationpage> {
  String? _selectedGender;
  bool fullTime = false;
  bool partTime = false;
  bool oneTime = false;

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
              SizedBox(height: 40),
              Image.asset("assets/Group 1382.png", width: 280, height: 150),
              Text("Fill your Location and Availability",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF006442)),
              ),
              SizedBox(height: 15),

              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text("Preferred Work Location *", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                ),
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 40, top: 1),
                    child: Text("1st Preferred \n Location ",
                      style: TextStyle( fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 22), // space between label and text field
                  SizedBox(
                    width: 190,
                    height: 50,
                    child: TextField(
                      maxLength: 30,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: '',
                       // hintText: '',
                      ),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 40, top: 1),
                    child: Text("2nd Preffered \n Location ",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 20), // space between label and text field
                  SizedBox(
                    width: 190,
                    height: 50,
                    child: TextField(
                      maxLength: 30,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: '',
                       // hintText: 'Enter your name',
                      ),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 40, top: 1),
                    child: Text("2nd Preffered \n Location ",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 20), // space between label and text field
                  SizedBox(
                    width: 190,
                    height: 50,
                    child: TextField(
                      maxLength: 30,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: '',
                      //  hintText: 'Enter your name',
                      ),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Text("If preferred job location is not available \n then are youwilling to relocate?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Align the content to the left by default
                    children: [
                      SizedBox(width: 40), // Adds a little space from the left edge
                      Radio<String>(
                        value: 'Yes',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                      Text('Yes',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                      SizedBox(width: 40),
                      Radio<String>(
                        value: 'NO',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                      Text('No',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),

              // Work Availability Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 40, bottom: 10),
                  child: Text("Work Availability (you can choose \n multiple options) *",
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
                        Transform.scale(
                          scale: 1,
                          child: Checkbox(
                            value: fullTime,
                            onChanged: (value) {
                              setState(() {
                                fullTime = value!;
                              });
                            },
                          ),
                        ),
                        const Text("Full-Time",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                        const SizedBox(width: 30),
                        Transform.scale(
                          scale: 1,
                          child: Checkbox(
                            value: partTime,
                            onChanged: (value) {
                              setState(() {
                                partTime = value!;
                              });
                            },
                          ),
                        ),
                        const Text("Part-Time",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1,
                          child: Checkbox(
                            value: oneTime,
                            onChanged: (value) {
                              setState(() {
                                oneTime = value!;
                              });
                            },
                          ),
                        ),
                        const Text("One-Time",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                      ],
                    ),

                  ],
                ),
              ),



              Spacer(),

              ElevatedButton(onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context){return Workexp();}), );}, child:Text("Continue",style: TextStyle(fontSize: 18), ),style:  ElevatedButton.styleFrom(backgroundColor: Color(0xFF006442),
                foregroundColor: Colors.white,
                minimumSize: Size(300, 60),),),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
*/
import 'package:code_exlity/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:code_exlity/services/api_service.dart';
// make sure this points to your ApiService
import 'WorkExp.dart';

class Preflocationpage extends StatefulWidget {
  const Preflocationpage({super.key});

  @override
  State<Preflocationpage> createState() => _PreflocationpageState();
}

class _PreflocationpageState extends State<Preflocationpage> {
  String? _selectedLocation1;
  String? _selectedLocation2;
  String? _selectedLocation3;
  String? _relocate;
  bool fullTime = false;
  bool partTime = false;
  bool oneTime = false;

  List<dynamic> _locations = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchLocations();
  }

  Future<void> _fetchLocations() async {
    try {
      final data = await ApiService.getLocations();
      setState(() {
        _locations = data;
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error fetching locations: $e")));
    }
  }

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
        body:
            _loading
                ? const Center(child: CircularProgressIndicator())
                : Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Image.asset(
                          "assets/Group 1382.png",
                          width: 280,
                          height: 150,
                        ),
                        const Text(
                          "Fill your Location and Availability",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF006442),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Dropdowns for Preferred Locations
                        _buildDropdown(
                          "1st Preferred Location",
                          _selectedLocation1,
                          (val) => setState(() => _selectedLocation1 = val),
                        ),
                        const SizedBox(height: 10),
                        _buildDropdown(
                          "2nd Preferred Location",
                          _selectedLocation2,
                          (val) => setState(() => _selectedLocation2 = val),
                        ),
                        const SizedBox(height: 10),
                        _buildDropdown(
                          "3rd Preferred Location",
                          _selectedLocation3,
                          (val) => setState(() => _selectedLocation3 = val),
                        ),
                        const SizedBox(height: 20),

                        // Relocation
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 40),
                            child: Text(
                              "If preferred job location is not available \n then are you willing to relocate?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 40),
                            Radio<String>(
                              value: 'Yes',
                              groupValue: _relocate,
                              onChanged:
                                  (val) => setState(() => _relocate = val),
                            ),
                            const Text("Yes", style: TextStyle(fontSize: 18)),
                            const SizedBox(width: 40),
                            Radio<String>(
                              value: 'No',
                              groupValue: _relocate,
                              onChanged:
                                  (val) => setState(() => _relocate = val),
                            ),
                            const Text("No", style: TextStyle(fontSize: 18)),
                          ],
                        ),

                        const SizedBox(height: 15),

                        // Work Availability
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 40, bottom: 10),
                            child: Text(
                              "Work Availability (you can choose multiple options) *",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
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
                                    onChanged:
                                        (v) => setState(() => fullTime = v!),
                                  ),
                                  const Text(
                                    "Full-Time",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(width: 30),
                                  Checkbox(
                                    value: partTime,
                                    onChanged:
                                        (v) => setState(() => partTime = v!),
                                  ),
                                  const Text(
                                    "Part-Time",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: oneTime,
                                    onChanged:
                                        (v) => setState(() => oneTime = v!),
                                  ),
                                  const Text(
                                    "One-Time",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

                        ElevatedButton(
                          onPressed: () {
                            // TODO: Save selected data to backend
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Workexp(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF006442),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(300, 60),
                          ),
                          child: const Text(
                            "Continue",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    String? value,
    Function(String?) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 5),
          DropdownButtonFormField<String>(
            value: value,
            isExpanded: true,
            items:
                _locations
                    .map<DropdownMenuItem<String>>(
                      (loc) => DropdownMenuItem<String>(
                        value: loc.toString(),
                        child: Text(loc.toString()),
                      ),
                    )
                    .toList(),
            onChanged: onChanged,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }
}
