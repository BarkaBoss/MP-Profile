import 'package:get/utils.dart';

import 'shared.dart';
import 'package:flutter/foundation.dart';
import 'package:micro_press_profile/ImageStrings.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:micro_press_profile/scanner_overlay.dart';
import 'package:camera_web/camera_web.dart';
import 'data_page.dart';
import 'staff.dart';

var db = constructDb();
//var db = MyDatabase(NativeDatabase.memory());
//var db = MyDatabase(WebDatabase('db'));

Future<void> main() async {

  (await db.select(db.staff).get()).forEach(print);
  (await db.delete(db.staff)).go();

  await db.into(db.staff).insert(StaffCompanion.insert(
      name: "Sarki Amada",
      gender: "Male",
      position: "CEO",
      staffID: "126VG87ABJ",
      dateOfBirth: "20/10/1972",
      imageBaseSixFour: ImageStrings.ceo));

await db.into(db.staff).insert(StaffCompanion.insert(
      name: "Jonah Mamman",
      gender: "Male",
      position: "Accountant",
      staffID: "MP0216ABJ2",
      dateOfBirth: "27/11/1987",
      imageBaseSixFour: ImageStrings.accountant));

await db.into(db.staff).insert(StaffCompanion.insert(
      name: "Christopher Wakawa,",
      gender: "Male",
      position: "Xerox Operator",
      staffID: "MP0820ABJ5",
      dateOfBirth: "23/05/1987",
      imageBaseSixFour: ImageStrings.xeroxOperator));

  await db.into(db.staff).insert(StaffCompanion.insert(
      name: "Rose Amada",
      gender: "Female",
      position: "SEO",
      staffID: "136VG88ABJ",
      dateOfBirth: "20/10/2006",
      imageBaseSixFour: ImageStrings.anotherStaffImage));

  (await db.select(db.staff).get()).forEach(print);


  runApp(const MyApp());
}


Future<StaffData> getStaff(String staffID) async{
  if(staffID.length > 200){
    String subID = staffID.substring(100, 110);
    return (await (db.select(db.staff)
      ..where((a) => a.staffID.equals(subID))).get()).first;
  }else {
    debugPrint("No data found");
    return const StaffData(id: 0, name: "name", gender: "0",
        position: "position", staffID: "0", dateOfBirth: "0",
        imageBaseSixFour: "0");
  }

}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Profile Scanner",
      home: HomePage(),
      // home: DataPage(staffID: "ID007",
      //     name: "James Bond",
      //     position: "Dev",
      //     dateOfBirth: "5/4/1987",
      //     gender: "Male",
      //     imageSixFour: ImageStrings.anotherStaffImage),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final MobileScannerController _scannerController = MobileScannerController();

  String dex = "x";
  bool start = false;
  @override
  Widget build(BuildContext context) {
    //_scannerController.barcodesController.onPause;
    //_scannerController.stop();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Micro Press Scanner"),
        actions: [
          IconButton(
              onPressed: () {
                _scannerController.switchCamera();
              },
              icon: const Icon(Icons.flip_camera_android))
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
              allowDuplicates: true,
              controller: _scannerController,
              onDetect: (barcode, args) {
                if (barcode.rawValue == null) {
                  debugPrint('Failed to scan QR');
                } else {
                  final String code = barcode.rawValue!;
                  setState(() {
                    dex = code;
                    //Future.delayed(const Duration(milliseconds: 100));
                  });

                  debugPrint('QR found! $code');
                  print("done");
              }
              }),
          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
          dex == "x" ? const Text("") :
          FutureBuilder<StaffData> (
              future: getStaff(dex),
              //initialData: [],
              builder: (context, snapshot) {

                if (snapshot.hasData && snapshot.data?.staffID != "0") {
                  print('Found you ${snapshot.data?.staffID}');

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) =>
                            DataPage(
                              staffID: snapshot.data?.staffID,
                              name: snapshot.data?.name,
                              position: snapshot.data?.dateOfBirth,
                              dateOfBirth: snapshot.data?.gender,
                              imageSixFour: snapshot.data?.imageBaseSixFour,
                              gender: snapshot.data?.position,
                            )));
                  });
                  return const Text(
                    "Data found",
                    style: TextStyle(color: Colors.grey),);
                }
                else {
                  return const Text(
                      "No data found for the this QR",
                      style: TextStyle(color: Colors.grey));
                }
              }),
        ],
      ),
    );
  }
}