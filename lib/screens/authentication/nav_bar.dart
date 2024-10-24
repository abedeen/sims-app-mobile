import 'package:admin/screens/authentication/button.dart';
import 'package:admin/screens/authentication/style.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final List _isHovering = [false, false];

  // Controllers for email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Remember to dispose of the controllers
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    // Define 'active' and 'disable' colors if not already defined
    // Replace with your desired color
    final Color disable = Colors.grey; // Replace with your desired color

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        // color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Mbooke',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: active,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: screenSize.width / 8),
                    // Email TextField
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[0] = true
                              : _isHovering[0] = false;
                        });
                      },
                      hoverColor: Colors.transparent,
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            width: screenSize.width / 5,
                            child: SizedBox(
                              height: 33,
                              child: TextField(
                                controller: emailController,
                                style: TextStyle(color: active, fontSize: 17),
                                clipBehavior: Clip.none,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  hintStyle:
                                      TextStyle(color: active, fontSize: 13),
                                  prefixIconColor: active,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    size: 20,
                                  ),
                                  counterStyle:
                                      TextStyle(color: active, fontSize: 13),
                                  hintText: "Email",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              decoration: BoxDecoration(
                                color: active,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 7,
                              width: 7,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 100),
                    // Password TextField
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[0] = true
                              : _isHovering[0] = false;
                        });
                      },
                      hoverColor: Colors.transparent,
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            height: 33,
                            width: screenSize.width / 6,
                            padding: EdgeInsets.only(left: 8),
                            child: TextField(
                              controller: passwordController,
                              style: TextStyle(color: active, fontSize: 17),
                              obscureText: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                hintStyle:
                                    TextStyle(color: active, fontSize: 13),
                                prefixIconColor: active,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 20,
                                ),
                                hintText: "Password",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 7,
                              width: 7,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 50),
                    // Log In Button (No pop-up)
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[1] = true
                              : _isHovering[1] = false;
                        });
                      },
                      hoverColor: Colors.transparent,
                      onTap: () {
                        // Perform login action or navigate to MainScreen
                        Navigator.pushNamed(context, '/home');
                      },
                      child: CustomButton(text: 'Log in'),
                    ),
                    SizedBox(width: screenSize.width / 20),
                  ],
                ),
              ),
              // Register Button with Pop-up
              InkWell(
                onTap: () {



showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // Use a StatefulBuilder to manage state within the dialog
                      return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          // Controllers for the input fields
                          TextEditingController nameController =
                              TextEditingController();
                          TextEditingController surnameController =
                              TextEditingController();
                          TextEditingController companyController =
                              TextEditingController();
                          TextEditingController registrationController =
                              TextEditingController();
                          TextEditingController yearController =
                              TextEditingController();
                          TextEditingController ownerNameController =
                              TextEditingController();
                          TextEditingController ownerIdController =
                              TextEditingController();
                          TextEditingController locationController =
                              TextEditingController();
                          TextEditingController emailController =
                              TextEditingController();
                          TextEditingController phoneController =
                              TextEditingController();
                          TextEditingController sectorController =
                              TextEditingController();

                          return 
                          
                          
                          Dialog(
                            child: Container(
                              width: 600, // Increase the width of the dialog
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      16.0), // Increase padding for better spacing
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Title
                                      Text(
                                        'Register',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 20),
                                      // Row 1: Name and Surname
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              controller: nameController,
                                              decoration: InputDecoration(
                                                labelText: 'Name',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              width:
                                                  20), // Increase space between columns
                                          Expanded(
                                            child: TextField(
                                              controller: surnameController,
                                              decoration: InputDecoration(
                                                labelText: 'Surname',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      // Row 2: Company Name and Registration Number
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              controller: companyController,
                                              decoration: InputDecoration(
                                                labelText: 'Company Name',
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Expanded(
                                            child: TextField(
                                              controller:
                                                  registrationController,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Registration Number',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      // Row 3: Year Started and Sector
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              controller: yearController,
                                              decoration: InputDecoration(
                                                labelText: 'Year Started',
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Expanded(
                                            child: TextField(
                                              controller: sectorController,
                                              decoration: InputDecoration(
                                                labelText: 'Sector',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      // Row 4: Owner's Name and ID Card
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              controller: ownerNameController,
                                              decoration: InputDecoration(
                                                labelText: "Owner's Name",
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Expanded(
                                            child: TextField(
                                              controller: ownerIdController,
                                              decoration: InputDecoration(
                                                labelText: "Owner's ID Card",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      // Row 5: Location and Email
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              controller: locationController,
                                              decoration: InputDecoration(
                                                labelText: 'Location',
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Expanded(
                                            child: TextField(
                                              controller: emailController,
                                              decoration: InputDecoration(
                                                labelText: 'Email',
                                              ),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      // Row 6: Phone Number
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              controller: phoneController,
                                              decoration: InputDecoration(
                                                labelText: 'Phone Number',
                                              ),
                                              keyboardType: TextInputType.phone,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Expanded(
                                            child: SizedBox
                                                .shrink(), // Empty space to align layout
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 30),
                                      // Actions
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog
                                            },
                                            child: Text('Cancel'),
                                          ),
                                          SizedBox(width: 20),
                                          ElevatedButton(
                                            onPressed: () {
                                              // Retrieve the input values
                                              String name =
                                                  nameController.text.trim();
                                              String surname =
                                                  surnameController.text.trim();
                                              String company =
                                                  companyController.text.trim();
                                              String registrationNumber =
                                                  registrationController.text
                                                      .trim();
                                              String yearStarted =
                                                  yearController.text.trim();
                                              String ownerName =
                                                  ownerNameController.text
                                                      .trim();
                                              String ownerId =
                                                  ownerIdController.text.trim();
                                              String location =
                                                  locationController.text
                                                      .trim();
                                              String email =
                                                  emailController.text.trim();
                                              String phone =
                                                  phoneController.text.trim();
                                              String sector =
                                                  sectorController.text.trim();

                                              // Perform registration logic here
                                              // For example, validate inputs and send data to the server

                                              Navigator.of(context)
                                                  .pop(); // Close the dialog
                                              // Navigate to another screen or show a success message
                                            },
                                            child: Text('Proceed'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );













                  







                },
                child: CustomButton(
                  text: "Register",
                ),
              ),
              SizedBox(width: screenSize.width / 40),
            ],
          ),
        ),
      ),
    );
  }
}
