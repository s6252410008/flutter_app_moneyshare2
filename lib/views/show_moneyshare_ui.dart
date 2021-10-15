import 'package:flutter/material.dart';

class ShowMoneyshareUI extends StatefulWidget {
  //ตัวแปรที่จะรับค่าที่ส่งมา
  double money = 0, tip = 0, moneyshare = 0;
  int person = 0;

  // คอนสครักเตอร์ที่จะไว้รับค่าที่ส่งมาเพื่อกำหนดให้กับตัวแปรที่สร้างข้างบน
  ShowMoneyshareUI(
      {Key? key,
      required this.money,
      required this.tip,
      required this.person,
      required this.moneyshare})
      : super(key: key);

  @override
  _ShowMoneyshareUIState createState() => _ShowMoneyshareUIState();
}

class _ShowMoneyshareUIState extends State<ShowMoneyshareUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text(
          'ผลการแชร์',
        ),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 80.0,
              ),
              Image.asset(
                'assets/images/money.png',
                height: 120.0,
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'จำนวนเงินที่จะหาร',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                widget.money.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.green,
                ),
              ),
              Text(
                'บาท',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนเงินที่จะหาร',
              ),
              Text(
                widget.person.toString(),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.green,
                ),
              ),
              Text(
                'บาท',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนเงินทิป',
              ),
              Text(
                widget.tip.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.green,
                ),
              ),
              Text(
                'บาท',
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'สรุปว่าหารคนละ',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                widget.moneyshare.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.red,
                ),
              ),
              Text(
                'บาท',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
