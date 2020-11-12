import 'package:flutter/material.dart';
import 'dart:math';

class BMIResult extends StatelessWidget {
  BMIResult(
      {@required this.tinggi_badan,
        @required this.berat_badan,
        this.nama,
        this.kelamin,
        this.tanggal,
        this.bulan,
        this.tahun});
  final int tinggi_badan;
  final int berat_badan;
  final String nama;
  final String kelamin;
  final String tanggal;
  final String bulan;
  final String tahun;

  @override
  Widget build(BuildContext context) {
    double bmi = berat_badan / pow(tinggi_badan / 100, 2);
    String cBMI;
    DateTime tahunnow = DateTime.now();
    int umur = tahunnow.year - int.parse(tahun);
    if (tahunnow.month > int.parse(bulan)) {
      ++umur;
    } else if (tahunnow.month == int.parse(bulan)) {
      if (tahunnow.day > int.parse(tanggal)) {
        ++umur;
      }
    }
    String usia = "$umur";
    if (bmi >= 28)
      cBMI = "Obese";
    else if (bmi >= 23)
      cBMI = "Overweight";
    else if (bmi >= 17.5)
      cBMI = "Normal";
    else
      cBMI = "Underweight";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RESULT'),
        backgroundColor: Colors.black12,
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              nama,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            Text(
              "Umur: " + usia,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Text(
              kelamin,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Text(
              cBMI,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Text(
              bmi.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            Text(
              'Normal BMI Range',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            Text(
              '17,5 -  22.9 ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}