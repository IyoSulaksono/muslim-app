import 'package:adzan_alarm/assets/constant.dart';
import 'package:flutter/material.dart';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String shubuh = '';
  String dzuhur = '';
  String ashar = '';
  String maghrib = '';
  String isya = '';

  double lintang = 0;
  double bujur = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getShalatTime();
  }

  void getShalatTime() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition();
    double latitude = position.latitude;
    double longitude = position.longitude;

    tz.initializeTimeZones();
    final location = tz.getLocation('Asia/Jakarta');

    DateTime date = tz.TZDateTime.from(DateTime.now(), location);
    Coordinates coordinates = Coordinates(0, 0);

    CalculationParameters params = CalculationMethod.muslimWorldLeague();
    params.madhab = Madhab.shafi;
    PrayerTimes ShalatTimes = PrayerTimes(
        date: date, coordinates: coordinates, calculationParameters: params);

    setState(() {
      shubuh = DateFormat('HH:mm')
          .format(tz.TZDateTime.from(ShalatTimes.fajr!, location))
          .toString();
      dzuhur = DateFormat('HH:mm')
          .format(tz.TZDateTime.from(ShalatTimes.dhuhr!, location))
          .toString();
      ashar = DateFormat('HH:mm')
          .format(tz.TZDateTime.from(ShalatTimes.asr!, location))
          .toString();
      maghrib = DateFormat('HH:mm')
          .format(tz.TZDateTime.from(ShalatTimes.maghrib!, location))
          .toString();
      isya = DateFormat('HH:mm')
          .format(tz.TZDateTime.from(ShalatTimes.isha!, location))
          .toString();

      lintang = latitude;
      bujur = longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [color1, color2])),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Adzan Shalat",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(lintang.toString() + ' , ' + bujur.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 15))
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Image.asset('assets/images/mesjid_mono.png'),
            SizedBox(
              height: 25,
            ),
            _shalat('Shubuh', shubuh),
            SizedBox(
              height: 5,
            ),
            _shalat('Dzuhur', dzuhur),
            SizedBox(
              height: 5,
            ),
            _shalat('Ashar', ashar),
            SizedBox(
              height: 5,
            ),
            _shalat('Maghrib', maghrib),
            SizedBox(
              height: 5,
            ),
            _shalat('Isya', isya),
          ],
        ),
      ),
    );
  }
}

Widget _shalat(String nama, String waktu) {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
        color: Colors.black, borderRadius: BorderRadius.circular(10)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          nama,
          style: TextStyle(color: Colors.white),
        ),
        Row(
          children: [
            Text(
              waktu,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.volume_up,
              color: Colors.white,
            )
          ],
        )
      ],
    ),
  );
}
