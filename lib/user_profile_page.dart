import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_profile_screen/user%20profile%20display%20page.dart';
import 'main.dart';

void main() {
  runApp(const MyApp());
}

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genController = TextEditingController();
  final TextEditingController _comController = TextEditingController();
  final TextEditingController _desController = TextEditingController();
  final TextEditingController _maritalController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  File? _image;
  String _selectedGender = '';
  String _selectedMaritalStatus = '';

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobController.dispose();
    _emailController.dispose();
    _genController.dispose();
    _comController.dispose();
    _desController.dispose();
    _maritalController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _selectGender() async {
    final selectedGender = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Gender'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Male'),
                onTap: () {
                  Navigator.pop(context, 'Male');
                },
              ),
              ListTile(
                title: const Text('Female'),
                onTap: () {
                  Navigator.pop(context, 'Female');
                },
              ),
              ListTile(
                title: const Text('Other'),
                onTap: () {
                  Navigator.pop(context, 'Other');
                },
              ),
            ],
          ),
        );
      },
    );

    if (selectedGender != null) {
      setState(() {
        _selectedGender = selectedGender;
      });
    }
  }

  void _selectMaritalStatus() async {
    final selectedMaritalStatus = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Marital Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Single'),
                onTap: () {
                  Navigator.pop(context, 'Single');
                },
              ),
              ListTile(
                title: const Text('Married'),
                onTap: () {
                  Navigator.pop(context, 'Married');
                },
              ),
              ListTile(
                title: const Text('Divorced'),
                onTap: () {
                  Navigator.pop(context, 'Divorced');
                },
              ),
              ListTile(
                title: const Text('Widowed'),
                onTap: () {
                  Navigator.pop(context, 'Widowed');
                },
              ),
            ],
          ),
        );
      },
    );

    if (selectedMaritalStatus != null) {
      setState(() {
        _selectedMaritalStatus = selectedMaritalStatus;
      });
    }
  }

  void _submitForm() {
    // Handle form submission logic here
    String first = _firstNameController.text;
    String last = _lastNameController.text;
    int? mob = int.parse(_mobController.text);
    String email = _emailController.text;
    String gen = _genController.text;
    String com = _comController.text;
    String des = _desController.text;
    String marital = _maritalController.text;
    String state = _stateController.text;
    String city = _cityController.text;
    String pin = _pinController.text;


    // Navigate to the next screen and pass the data as arguments
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailsPage(
          first: first,
          last:last,
          mob: mob,
          email: email,
          gen: _selectedGender,
          com: com,
          des: des,
          marital: _selectedMaritalStatus,
          state: state,
          city: city,
          pin: pin,
          image: _image,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: SafeArea(child: const Text('Profile',style: TextStyle(fontSize: 27,color: Colors.blue),)),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera_alt),
                              title: const Text('Take a photo'),
                              onTap: () {
                                Navigator.pop(context);
                                _pickImage(ImageSource.camera);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo),
                              title: const Text('Choose from gallery'),
                              onTap: () {
                                Navigator.pop(context);
                                _pickImage(ImageSource.gallery);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.purple[100],
                        backgroundImage: _image != null ? FileImage(_image!) : null,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            if (_image == null)
                              Positioned(
                                child: Icon(Icons.person, size: 25, color: Colors.black),
                              ),
                            // Add your second icon here
                            Positioned(
                              left: 25,
                              top: 30,
                              child: Container(
                                decoration: ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: Colors.indigo,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.photo_camera_sharp, size: 25, color: Colors.white),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ),
              Column(
                children: [
                  InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SafeArea(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.camera_alt),
                                    title: const Text('Take a photo'),
                                    onTap: () {
                                      Navigator.pop(context);
                                      _pickImage(ImageSource.camera);
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.photo),
                                    title: const Text('Choose from gallery'),
                                    onTap: () {
                                      Navigator.pop(context);
                                      _pickImage(ImageSource.gallery);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child:
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0,top: 10),
                        child: Center(child: Text("Edit Profile",style: TextStyle(fontSize: 17),)),
                      ))
                ],
              ),
              const SizedBox(height: 5),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    labelText: 'First Name',
                    hintText: 'Enter your first name',
                    suffixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    labelText: 'Last Name',
                    hintText: 'Enter your last name',
                    suffixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _mobController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    labelText: 'Mobile No',
                    hintText: 'Enter your number',
                    suffixIcon: Icon(Icons.phone),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    suffixIcon: Icon(Icons.email_outlined),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    _selectGender();
                  },
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      labelText: 'Select Gender',
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedGender.isNotEmpty ? _selectedGender : 'Select Gender',
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _comController,
                  //keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    labelText: 'Company Name',
                    hintText: 'Enter your Company Name',
                    suffixIcon: Icon(Icons.work),

                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _desController,
                  //keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    labelText: 'Designation',
                    hintText: 'Enter your Designation',
                    suffixIcon: Icon(Icons.design_services),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    _selectMaritalStatus();
                  },
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      labelText: 'Select Marital Status',
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedMaritalStatus.isNotEmpty ? _selectedMaritalStatus : 'Select Marital Status',
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _stateController,
                  //keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    labelText: 'State',
                    hintText: 'Enter your State',
                    suffixIcon: Icon(Icons.location_on_sharp),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _cityController,
                  //keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    labelText: 'City',
                    hintText: 'Enter your City',
                    suffixIcon: Icon(Icons.home),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _pinController,
                  //keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    labelText: 'Pincode',
                    hintText: 'Enter your Pincode',
                    suffixIcon: Icon(Icons.pin_drop),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your onPressed functionality here
                      // For example, you can call a function to handle the update action
                      _submitForm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      minimumSize: Size(380, 45),
                    ),
                    child: const Text(
                      'Update',
                      style: TextStyle(fontSize: 21, color: Colors.white),
                    ),
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
