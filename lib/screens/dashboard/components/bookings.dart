import 'package:admin/models/recent_file.dart';

import 'package:flutter/material.dart';

import '../../../constants.dart';

class Bookings extends StatelessWidget {
  const Bookings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Text(
                "Pending Bookings",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                //style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: InkWell(
                onTap: () {
                 showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // Use a StatefulBuilder to manage state within the dialog
                      return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          // Controllers for the input fields
                         
        
                          return Dialog(
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
                                        'Booking details',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 20),
                                      // Row 1: Name and Surname
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text('Full Name')
                                          ),
                                          SizedBox(
                                              width:
                                                  20), // Increase space between columns
                                          Expanded(
                                            child: Text('Thabang Dompreho')
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      // Row 2: Company Name and Registration Number
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text('Location: ')
                                          ),
                                          SizedBox(width: 20),
                                          Expanded(
                                            child: Text('Gaborone')
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      // Row 3: Year Started and Sector
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text('Service: ')
                                          ),
                                          SizedBox(width: 20),
                                          Expanded(
                                            child: Text('Hair cut')
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      // Row 4: Owner's Name and ID Card
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text('Price: ')
                                          ),
                                          SizedBox(width: 20),
                                          Expanded(
                                            child: Text('P250.00')
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      // Row 5: Location and Email
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text('Booking time:')
                                          ),
                                          SizedBox(width: 20),
                                          Expanded(
                                            child: Text('1500hrs')
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      // Row 6: Phone Number
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text('Phone number: ')
                                          ),
                                          SizedBox(width: 20),
                                           Expanded(child: Text('+267 75470516')),
                                        ],
                                      ),
                                      SizedBox(height: 30),
                                      // Actions
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
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
                                             
        
                                              // Perform registration logic here
                                              // For example, validate inputs and send data to the server
        
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog
                                              // Navigate to another screen or show a success message
                                            },
                                            child: Text('Process booking'),
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
                child: DataTable(
                  columnSpacing: defaultPadding,
                  // minWidth: 600,
                  columns: [
                    DataColumn(
                      label: Text("Client Name"),
                    ),
                    DataColumn(
                      label: Text("Email Address"),
                    ),
                    DataColumn(
                      label: Text("Service type"),
                    ),
                  ],
                  rows: List.generate(
                    demoRecentFiles.length,
                    (index) => recentFileDataRow(demoRecentFiles[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
    ],
  );
}
