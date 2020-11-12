import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'bmi_result.dart';



class InputBMI extends StatefulWidget {
  @override
  _InputBMIState createState() => _InputBMIState();
}

class _InputBMIState extends State<InputBMI> {
  int tinggi = 0;
  int berat = 0;
  String nama = '';
  String dropdownValue;
  String tanggal;
  String bulan;
  String tahun;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        //backgroundColor: Colors.black,
        appBar: AppBar(
          //backgroundColor: Colors.white,
          centerTitle: true,
          leading: Icon(
            Icons.home,
            color: Colors.white,
          ),
          title: Text('Menghitung BMI',),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.thumb_up, color: Colors.white,)),
            IconButton(icon: Icon(Icons.thumb_down, color: Colors.white,))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child:
                Image.asset('images/foto1.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),

              Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      new ListTile(
                        title: TextField(
                          onChanged: (txt) {
                            setState(() {
                              nama = txt;
                            });
                          },
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Nama',
                          ),
                        ),
                      ),
                    ],
                  )),

              Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      new ListTile(
                        title: DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValue,
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          hint: new Text(' Jenis-Kelamin'),
                          underline: Container(height: 1, color: Colors.black),
                          items: <String>['Laki-laki', 'Perempuan']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  )),

              Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onChanged: (txt) {
                            setState(() {
                              tanggal = txt;
                            });
                          },
                          keyboardType: TextInputType.number,
                          maxLength: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Tanggal',
                            icon: Icon(Icons.date_range, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (txt) {
                            setState(() {
                              bulan = txt;
                            });
                          },
                          keyboardType: TextInputType.number,
                          maxLength: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Bulan',
                            icon: Icon(Icons.date_range, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (txt) {
                            setState(() {
                              tahun = txt;
                            });
                          },
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Tahun',
                            icon: Icon(Icons.date_range, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )),


              Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onChanged: (txt) {
                            setState(() {
                              tinggi = int.parse(txt);
                            });
                          },
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                              suffix: Text('cm'),

                              filled: true,
                              hintText: 'Tinggi'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (txt) {
                            setState(() {
                              berat = int.parse(txt);
                            });
                          },
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                              suffix: Text('kg'),
                              filled: true,
                              hintText: 'Berat'),
                        ),
                      ),
                    ],
                  )),

              Container(
                //height: double.infinity,
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BMIResult(
                              tinggi_badan: tinggi,
                              berat_badan: berat,
                              nama: nama,
                              kelamin: dropdownValue,
                              tanggal: tanggal,
                              bulan: bulan,
                              tahun: tahun)),
                    );
                  },
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  color: Colors.white70,
                  textColor: Colors.black,
                  child: Text(
                    'HITUNG BMI',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          //color: Colors.transparent,
          child: Container(
            height: 45,
            color: Colors.black54,
            alignment: Alignment.center,
            child: Text(
              'Developed by Made',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          //elevation: 0,
        ),
      );
  }
}