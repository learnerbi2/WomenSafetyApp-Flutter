
//import 'package:csc_picker/model/select_status_model.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:shesecure/TextInputField.dart';
import 'package:shesecure/homepage.dart';
//import 'package:womensafetyapp/backgroundsos.dart';
//import 'package:womensafetyapp/sosFunction.dart';

const primaryColor = Colors.black;

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _voiceController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();

  // final TextEditingController _parentFirstNameController =
  //     TextEditingController();
  // final TextEditingController _parentLastNameController =
  //     TextEditingController();
  final TextEditingController _emergencyContactController =
      TextEditingController();

  String? _selectedGrade;
  String? _selectedShirtSize;

  final List<String> _work = ['Student', 'Job', 'Home Maker', 'Others'];
  final List<String> _gender = ['Male', 'Female', 'Others'];

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _addressController.dispose();
    _countryController.dispose();
    _stateController.dispose();
    _districtController.dispose();
    _emergencyContactController.dispose();
    super.dispose();
  }

  bool _validateFields() {
    if (_firstNameController.text.isEmpty || _lastNameController.text.isEmpty) {
      _showSnackbar("Please enter the participant's full name.");
      return false;
    }
    if (_addressController.text.isEmpty) {
      _showSnackbar("Please enter a valid address.");
      return false;
    }
    if (_selectedGrade == null) {
      _showSnackbar("Please select a profession.");
      return false;
    }
    if (_voiceController.text.isEmpty) {
      _showSnackbar("Please give her a Name.");
      return false;
    }
    if (_countryController.text.isEmpty) {
      _showSnackbar("Please select Country.");
      return false;
    }
    if (_stateController.text.isEmpty) {
      _showSnackbar("Please select State.");
      return false;
    }
    if (_districtController.text.isEmpty) {
      _showSnackbar("Please select District.");
      return false;
    }
    if (_emergencyContactController.text.isEmpty) {
      _showSnackbar("Please enter a contact.");
      return false;
    }
    return true;
  }

  void _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _submitForm() {
    if (_validateFields()) {
      // Perform the form submission logic here
      _showSnackbar("Form submitted successfully!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registration Form",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("User Name"),
              Row(
                children: [
                  //main details
                  Expanded(
                    child: TextInputField(
                      textEditingController: _firstNameController,
                      hintText: 'First',
                      textInputType: TextInputType.text,
                      isPass: false,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextInputField(
                      textEditingController: _lastNameController,
                      hintText: 'Last',
                      textInputType: TextInputType.text,
                      isPass: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "Address",
                style: TextStyle(color: primaryColor),
              ),
              TextInputField(
                textEditingController: _addressController,
                hintText: 'Enter Address',
                isPass: false,
                textInputType: TextInputType.streetAddress,
              ),
              const SizedBox(height: 16),
              const Text(
                "Contact",
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
              TextInputField(
                textEditingController: _emergencyContactController,
                hintText: 'Enter phone Number',
                textInputType: TextInputType.phone,
                isPass: false,
              ),
              const SizedBox(height: 16),
              const Text(
                "Profession",
                style: TextStyle(
                    color: primaryColor, backgroundColor: Colors.white),
              ),
              DropdownButtonFormField<String>(
                value: _selectedGrade,
                items: _work.map((String work) {
                  return DropdownMenuItem<String>(
                    value: work,
                    child: Text(
                      work,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedGrade = newValue;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your profession',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Gender",
                style: TextStyle(color: primaryColor),
              ),
              DropdownButtonFormField<String>(
                value: _selectedShirtSize,
                items: _gender.map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedShirtSize = newValue;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your Gender',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                      child: CSCPicker(
                    flagState: CountryFlag.ENABLE,
                    showStates: true,
                    showCities: true,
                    layout: Layout.vertical,
                    onCountryChanged: (Country) {},
                    onStateChanged: (state) {},
                    onCityChanged: (city) {},
                    stateDropdownLabel: "state",
                    cityDropdownLabel: "district",
                  )),
                  const SizedBox(width: 16),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Voice Recognizer",
                style: TextStyle(color: primaryColor),
              ),
              TextInputField(
                textEditingController: _voiceController,
                hintText: 'Give a Nice Name to me',
                textInputType: TextInputType.text,
                isPass: false,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                ),
                onPressed: () {
                  _submitForm();

                  // Navigator.push(context,
                  //   MaterialPageRoute(builder: (context) => SOSPage()));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MainApp()));
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
