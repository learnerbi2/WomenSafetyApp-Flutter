import 'package:flutter/material.dart';
import 'package:shesecure/TextInputField.dart';
import 'package:shesecure/bottomnavigation/bottompage.dart';

const primaryColor = Colors.black;

class RegiForm extends StatefulWidget {
  const RegiForm({super.key});

  @override
  State<RegiForm> createState() => _RegiFormState();
}

class _RegiFormState extends State<RegiForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _voiceController = TextEditingController();
  final TextEditingController _emergencyContactController = TextEditingController();

  String? _selectedProfession;
  String? _selectedGender;

  final List<String> _professions = ['Student', 'Job', 'Home Maker', 'Others'];
  final List<String> _genders = ['Male', 'Female', 'Others'];

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _addressController.dispose();
    _emergencyContactController.dispose();
    super.dispose();
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: const TextStyle(color: Colors.white)), backgroundColor: Colors.red),
    );
  }

  bool _validateFields() {
    if (_firstNameController.text.isEmpty || _lastNameController.text.isEmpty) {
      _showSnackbar("Please enter your full name.");
      return false;
    }
    if (_addressController.text.isEmpty) {
      _showSnackbar("Please enter a valid address.");
      return false;
    }
    if (_selectedProfession == null) {
      _showSnackbar("Please select a profession.");
      return false;
    }
    if (_voiceController.text.isEmpty) {
      _showSnackbar("Please enter a name for Voice Recognizer.");
      return false;
    }
    if (_emergencyContactController.text.isEmpty) {
      _showSnackbar("Please enter an emergency contact.");
      return false;
    }
    return true;
  }

  void _submitForm() {
    if (_validateFields()) {
      _showSnackbar("Form submitted successfully!");
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Form", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color:Color.fromARGB(255, 1, 50, 86), 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(   
              child: Card(
                shadowColor: Color.fromARGB(255, 11, 40, 61),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(colors: [
                    Color(0xFF01579B),
                    Color(0xFF0288D1),
                    Color.fromARGB(255, 9, 151, 227),
                    Color(0xFF4FC3F7),
                      ])
                    ),
                     child: Padding(
                  padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("User Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)),
                        Row(
                          children: [
                            Expanded(
                            
                                child: Card(
                                  color:  Color.fromARGB(255, 1, 50, 86),
                                  child: Padding(
                                    padding:const EdgeInsets.all(4.0) ,
                                    child: TextInputField(
                                      textEditingController: _firstNameController,
                                      hintText: 'First Name',
                                      textInputType: TextInputType.text,
                                      isPass: false,
                                    ),
                                  ),
                                ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Card(
                                color:  Color.fromARGB(255, 1, 50, 86),
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: TextInputField(
                                    textEditingController: _lastNameController,
                                    hintText: 'Last Name',
                                    textInputType: TextInputType.text,
                                    isPass: false,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                                  
                        const Text("Address", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)),
                        Card(
                          color:  Color.fromARGB(255, 1, 50, 86),
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: TextInputField(
                              textEditingController: _addressController,
                              hintText: 'Enter Address',
                              isPass: false,
                              textInputType: TextInputType.streetAddress,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                                  
                        const Text("Contact", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)),
                         Card(
                          color:  Color.fromARGB(255, 1, 50, 86),
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                        child: TextInputField(
                          textEditingController: _emergencyContactController,
                          hintText: 'Enter Phone Number',
                          textInputType: TextInputType.phone,
                          isPass: false,
                        ),)),
                        const SizedBox(height: 16),
                                  
                        const Text("Profession", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)),
                         
                          DropdownButtonFormField<String>(
                          value: _selectedProfession,
                          items: _professions.map((String profession) {
                            return DropdownMenuItem<String>(
                              value: profession,
                              child: Text(profession),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedProfession = newValue;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            hintText: 'Select your profession',
                          ),
                        ),
                        const SizedBox(height: 16),
                                  
                        const Text("Gender", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)),
                        
                        DropdownButtonFormField<String>(
                          value: _selectedGender,
                          items: _genders.map((String gender) {
                            return DropdownMenuItem<String>(
                              value: gender,
                              child: Text(gender),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedGender = newValue;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            hintText: 'Select your gender',
                          ),
                        ),
                        const SizedBox(height: 16),
                                  
                        const Text("Voice Recognizer", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)),
                         Card(
                          color:  Color.fromARGB(255, 1, 50, 86),
                          child: Padding(
                          padding: EdgeInsets.all(4.0),
                        child: TextInputField(
                          textEditingController: _voiceController,
                          hintText: 'Give a Nice Name',
                          textInputType: TextInputType.text,
                          isPass: false,
                        ),)),
                        const SizedBox(height: 32),
                                  
                        Center(
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 41, 148, 236),
                                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                onPressed: _submitForm,
                                child: const Text('Submit', style: TextStyle(color: Colors.white, fontSize: 16)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ),
        ),
      ),
    );
  }
}
