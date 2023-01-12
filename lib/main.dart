import 'shared.dart';
import 'package:flutter/foundation.dart';
import 'package:profile/ImageStrings.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:profile/scanner_overlay.dart';
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
      name: "Rose Amada",
      gender: "Female",
      position: "SEO",
      staffID: "136VG88ABJ",
      dateOfBirth: "20/10/2006",
      imageBaseSixFour: ImageStrings.anotherStaffImage));

  (await db.select(db.staff).get()).forEach(print);


  runApp(const MyApp());
}


Future<List<StaffData>> getStaff(String staffID) async{
  return (await (db.select(db.staff)
    ..where((a) => a.staffID.equals(staffID))).get());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Profile Scanner",
      home: HomePage(),
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
        title: const Text("Profile Scanner"),
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
          MaterialButton(onPressed: (){
            setState(() {
              start = true;
              CameraFacing.front;
              //_scannerController.barcodesController.onResume;
              //_scannerController.isStarting;
              //_scannerController.start();
            });
          },
              child: const Text("Start")),

          start == false ? const Text("") : MobileScanner(
              allowDuplicates: true,
              controller: _scannerController,
              onDetect: (barcode, args) {
                if (barcode.rawValue == null) {
                  debugPrint('Failed to scan QR');
                } else {
                  final String code = barcode.rawValue!;
                  setState(() {
                    dex = code;
                    Future.delayed(const Duration(milliseconds: 100));
                  });

                  debugPrint('QR found! $code');
                  print("done");
              }
              }),
          start == false ? const Text("") : QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
          dex == "x" ? const Text("") :
          FutureBuilder<List<StaffData>> (
              future: getStaff(dex.substring(0, 10)),
              //initialData: [],
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print('Found you ${snapshot.data?.first.staffID}');

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) =>
                            DataPage(
                              staffID: snapshot.data?.first.staffID,
                              name: snapshot.data?.first.name,
                              position: snapshot.data?.first
                                  .dateOfBirth,
                              dateOfBirth: snapshot.data?.first.gender,
                              imageSixFour: snapshot.data?.first
                                  .imageBaseSixFour,
                              gender: snapshot.data?.first.position,
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