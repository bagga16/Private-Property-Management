import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:private_property_management/Filters/Properties/PropertiesType.dart';
import 'package:private_property_management/Filters/Properties/location_filter.dart';
import 'package:private_property_management/Filters/Properties/number_of_units_filter.dart';
import 'package:private_property_management/Filters/Properties/status_filter.dart';
import 'package:private_property_management/Home.dart';
import 'package:private_property_management/Models/PropertyModel.dart';
import 'package:private_property_management/Widgest/PropertyCard.dart';
import 'AddPropertyScreen.dart';
import 'PropertyDetailsScreen.dart';

class Propertiesscreen extends StatefulWidget {
  const Propertiesscreen({super.key});

  @override
  State<Propertiesscreen> createState() => _PropertiesscreenState();
}

class _PropertiesscreenState extends State<Propertiesscreen> {
  int selectedTabIndex = 0; // To manage the active tab

  final List<PropertyModel> properties = [
    PropertyModel(
      title: "Sky Dandelions",
      id: "1163213",
      address: "Street, City, State, Zip Code, Country",
      type: "Residential",
      units: 20,
      description:
          "Lorem ipsum dolor sit amet consectetur. Feugiat lorem feugiat sit mauris justo.",
      createdDate: "20/01/2024",
      updatedDate: "20/01/2024",
      status: "Active",
      imagePath: 'assets/images/propertyImage.png',
      rent: "\$222/",
    ),
    PropertyModel(
      title: "Sky Dandelions",
      id: "1163214",
      address: "Street, City, State, Zip Code, Country",
      type: "Commercial",
      units: 15,
      description:
          "Lorem ipsum dolor sit amet consectetur. Feugiat lorem feugiat sit mauris justo.",
      createdDate: "20/01/2024",
      updatedDate: "20/01/2024",
      status: "In-Active",
      imagePath: 'assets/images/propertyImage.png',
      rent: "\$205/",
    ),
    PropertyModel(
      title: "Sky Dandelions",
      id: "1163214",
      address: "Street, City, State, Zip Code, Country",
      type: "Commercial",
      units: 15,
      description:
          "Lorem ipsum dolor sit amet consectetur. Feugiat lorem feugiat sit mauris justo.",
      createdDate: "20/01/2024",
      updatedDate: "20/01/2024",
      status: "In-Active",
      imagePath: 'assets/images/propertyImage.png',
      rent: "\$235/",
    ),
  ];

  // List of tabs
  final List<String> tabs = [
    "Property Type",
    "No. Of Units",
    "Location",
    "Status"
  ];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DatabaseReference _realtimeDB =
      FirebaseDatabase.instance.ref().child('property_images');

  Future<List<PropertyModel>> _fetchProperties() async {
    final snapshot = await _firestore.collection('All Properties').get();
    List<PropertyModel> properties = snapshot.docs
        .map((doc) => PropertyModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();

    for (var property in properties) {
      final imageSnapshot = await _realtimeDB.child(property.id).once();
      if (imageSnapshot.snapshot.value != null) {
        Map<String, dynamic> imagesMap =
            Map<String, dynamic>.from(imageSnapshot.snapshot.value as Map);
        property.imagePath = imagesMap.values.first['image'];
      }
    }
    return properties;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // Custom Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(245, 244, 248, 1),
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Color.fromRGBO(37, 43, 92, 1), size: 18),
                    ),
                  ),
                  const Text(
                    "Properties",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(37, 43, 92, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddPropertyScreen(),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromRGBO(37, 43, 92, 1),
                      child: Icon(Icons.add, color: Colors.white, size: 22),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Search Bar Row with Filter Button
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(245, 244, 248, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const TextField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: "Search Here",
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(37, 43, 92, 1),
                          ),
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.search,
                            color: Color.fromRGBO(37, 43, 92, 1),
                            size: 22,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      _openFilterPopup(context, selectedTabIndex);
                    },
                    child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(245, 244, 248, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Image(
                            image: AssetImage('assets/images/fliter.png'))),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Tab Bar
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    tabs.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTabIndex = index;
                          // Perform filtering logic here based on selected tab
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 12),
                        decoration: BoxDecoration(
                          color: selectedTabIndex == index
                              ? const Color.fromRGBO(35, 79, 104, 1)
                              : const Color.fromRGBO(245, 244, 248, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: selectedTabIndex == index
                                ? Colors.white
                                : const Color.fromRGBO(37, 43, 92, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Properties List
              Expanded(
                child: FutureBuilder<List<PropertyModel>>(
                  future: _fetchProperties(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final properties = snapshot.data!;
                    return ListView.builder(
                      itemCount: properties.length,
                      itemBuilder: (context, index) {
                        return PropertyCard(
                          property: properties[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PropertyDetailsScreen(
                                      property: properties[index])),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
                // ListView.builder(
                //   physics: const BouncingScrollPhysics(),
                //   itemCount: properties.length,
                //   itemBuilder: (context, index) {
                //     return PropertyCard(
                //       property: properties[index],
                //       onTap: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => PropertyDetailsScreen(
                //                     property: properties[index],
                //                   )),
                //         );
                //       },
                //     );
                //   },
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openFilterPopup(BuildContext context, int selectedTabIndex) {
    switch (selectedTabIndex) {
      case 0:
        showDialog(
          context: context,
          builder: (context) => const PropertyTypeFilter(),
        );
        break;
      case 1:
        showDialog(
          context: context,
          builder: (context) => const NumberOfUnitsFilter(),
        );
        break;
      case 2:
        showDialog(
          context: context,
          builder: (context) => const LocationFilter(),
        );
        break;
      case 3:
        showDialog(
          context: context,
          builder: (context) => const StatusFilter(),
        );
        break;
    }
  }
}
