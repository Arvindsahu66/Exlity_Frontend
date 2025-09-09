/*
import 'package:code_exlity/PersonalInfo.dart';
import 'package:flutter/material.dart';

class Locationpage extends StatefulWidget {
  const Locationpage({super.key});

  @override
  State<Locationpage> createState() => _LocationpageState();
}

class _LocationpageState extends State<Locationpage> {
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
              const SizedBox(height: 200),
              Image.asset("assets/Group 1382.png", width: 350, height: 150),
              const SizedBox(height: 5),
              const Text(
                "Write your Location ?",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Color(0xFF006442)),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: Text("Enter City/Area", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ),
              const SizedBox(height: 10),

              // Row containing TextField and Dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    height: 60,
                    child: TextField(
                      controller: _cityController,
                      maxLength: 30,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: '',
                        hintText: 'Type city',
                      ),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 15),
                  SizedBox(
                    width: 50,
                    height: 60,
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      ),
                      isExpanded: true,
                      hint: const Text("Select"),
                      items: _cities.map((String city) {
                        return DropdownMenuItem<String>(
                          value: city,
                          child: Text(city, overflow: TextOverflow.ellipsis),
                        );
                      }).toList(),
                      onChanged: (String? selectedCity) {
                        if (selectedCity != null) {
                          _cityController.text = selectedCity;
                        }
                      },
                    ),
                  ),
                ],
              ),

              const Spacer(),
              ElevatedButton(
                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context){return Personalinfo();}), );
                  print("Selected/Typed City: ${_cityController.text}");

                },
                child: const Text("Continue", style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006442),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(300, 50),
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
*/
/*
import 'package:code_exlity/PersonalInfo.dart';
import 'package:flutter/material.dart';
import 'package:code_exlity/services/mongo_service.dart';

class Locationpage extends StatefulWidget {
  const Locationpage({super.key});

  @override
  State<Locationpage> createState() => _LocationpageState();
}

class _LocationpageState extends State<Locationpage> {
  final _cityController = TextEditingController(text: "Bengaluru");
  final List<String> _cities = [
    'Bengaluru', 'Mumbai', 'Delhi', 'Chennai', 'Kolkata', 'Hyderabad'
  ];

  bool _saving = false;                                  // NEW

  Future<void> _handleContinue() async {                 // NEW
    setState(() => _saving = true);                      // show spinner

    try {
      //await MongoDatabase.insertCity(_cityController.text.trim());
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const Personalinfo()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save city: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);      // hide spinner
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              Image.asset("assets/Group 1382.png",
                  width: 350, height: 150),
              const SizedBox(height: 5),
              const Text("Write your Location ?",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF006442))),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: Text("Enter City/Area",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ),
              const SizedBox(height: 10),

              // ── Row with TextField + Dropdown ──
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    height: 60,
                    child: TextField(
                      controller: _cityController,
                      maxLength: 30,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: '',
                        hintText: 'Type city',
                      ),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 15),
                  SizedBox(
                    width: 50,
                    height: 60,
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      ),
                      isExpanded: true,
                      hint: const Text("Select"),
                      items: _cities.map((city) {
                        return DropdownMenuItem<String>(
                          value: city,
                          child: Text(city, overflow: TextOverflow.ellipsis),
                        );
                      }).toList(),
                      onChanged: (selectedCity) {
                        if (selectedCity != null) {
                          _cityController.text = selectedCity;
                        }
                      },
                    ),
                  ),
                ],
              ),

              const Spacer(),
              SizedBox(
                width: 300,
                height: 50,
                child: _saving                                  // NEW
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF006442),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _handleContinue,
                  child: const Text("Continue",
                      style: TextStyle(fontSize: 18)),
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
*/
import 'package:flutter/material.dart';
import 'package:code_exlity/PersonalInfo.dart';
import 'package:code_exlity/services/api_service.dart';

class Locationpage extends StatefulWidget {
  const Locationpage({super.key});

  @override
  State<Locationpage> createState() => _LocationpageState();
}

class _LocationpageState extends State<Locationpage> {
  final _cityController = TextEditingController();
  List<String> _cities = [];
  bool _loadingCities = true;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _fetchCities();
  }

  Future<void> _fetchCities() async {
    try {
      final cities = await ApiService.getCities();
      setState(() {
        _cities = cities;
        if (_cities.isNotEmpty) {
          _cityController.text = _cities.first; // default
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error fetching cities: $e")));
    } finally {
      setState(() => _loadingCities = false);
    }
  }

  Future<void> _handleContinue() async {
    setState(() => _saving = true);
    try {
      // TODO: send selected city to backend if needed
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const Personalinfo()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to save city: $e")));
    } finally {
      setState(() => _saving = false);
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              Image.asset("assets/Group 1382.png", width: 350, height: 150),
              const SizedBox(height: 5),
              const Text(
                "Write your Location ?",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF006442),
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: Text(
                    "Enter City/Area",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Loader until cities fetched
              if (_loadingCities)
                const Center(child: CircularProgressIndicator())
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 60,
                      child: TextField(
                        controller: _cityController,
                        maxLength: 30,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          counterText: '',
                          hintText: 'Type city',
                        ),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 120,
                      height: 60,
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 10,
                          ),
                        ),
                        isExpanded: true,
                        value: _cities.isNotEmpty ? _cityController.text : null,
                        items:
                            _cities.map((city) {
                              return DropdownMenuItem<String>(
                                value: city,
                                child: Text(
                                  city,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                        onChanged: (selectedCity) {
                          if (selectedCity != null) {
                            _cityController.text = selectedCity;
                          }
                        },
                      ),
                    ),
                  ],
                ),

              const Spacer(),
              SizedBox(
                width: 300,
                height: 50,
                child:
                    _saving
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF006442),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: _handleContinue,
                          child: const Text(
                            "Continue",
                            style: TextStyle(fontSize: 18),
                          ),
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
