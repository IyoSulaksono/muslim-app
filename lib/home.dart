import 'package:adzan_alarm/assets/constant.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
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
                Text("Posisi",
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
            _shalat('Shubuh', '05:00'),
            SizedBox(
              height: 5,
            ),
            _shalat('Dzuhur', '12:45'),
            SizedBox(
              height: 5,
            ),
            _shalat('Ashar', '16:02'),
            SizedBox(
              height: 5,
            ),
            _shalat('Maghrib', '18:41'),
            SizedBox(
              height: 5,
            ),
            _shalat('Isya', '20:01'),
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
