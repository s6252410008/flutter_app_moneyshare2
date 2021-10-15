import 'package:flutter/material.dart';
import 'package:flutter_app_moneyshare/views/show_moneyshare_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoneyshareUI extends StatefulWidget {
  const MoneyshareUI({Key? key}) : super(key: key);

  @override
  _MoneyshareUIState createState() => _MoneyshareUIState();
}

class _MoneyshareUIState extends State<MoneyshareUI> {
  bool tipCheck = false;
  TextEditingController txMoney = TextEditingController();
  TextEditingController txPerson = TextEditingController();
  TextEditingController txTip = TextEditingController();

  //เมธอดแสดง dialog โดยรับข้อความที่จะแสดงมาจากจุดที่เรียกใช้
  showWarningDialog(context, msg) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Container(
              color: Colors.green,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'คำเตือน ',
                ),
              ),
            ),
          ),
          content: Text(
            'msg',
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'msg',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          'แชร์เงินกันเถิด',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Image.asset(
                'assets/images/money.png',
                width: 120.0,
              ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: TextField(
                  controller: txMoney,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyBillWave,
                      color: Colors.green,
                    ),
                    hintText: 'ป้อนจำนวนเงิน   (บาท)',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: TextField(
                  controller: txPerson,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    hintText: 'ป้อนจำนวนคน   (คน)',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (data) {
                      setState(() {
                        if (data != null) {
                          tipCheck = data;
                          if (data == false) {
                            txTip.text = '';
                          }
                        }
                      });
                    },
                    value: tipCheck,
                    activeColor: Colors.green,
                    side: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    'ทิปให้พนักงานเสริฟ',
                    style: TextStyle(
                      color: Colors.green[800],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: TextField(
                  controller: txTip,
                  enabled: tipCheck,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.coins,
                      color: Colors.green,
                    ),
                    hintText: 'ป้อนจำนวนเงินทิป   (บาท)',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    //ตรวจสอบการป้อนต่างว่าป้อนหรือยัง ถ้ายังให้แสดง dialog เตือน
                    if (txMoney.text.length == 0) {
                      // แสดง dialog เตือน
                      showWarningDialog(context, 'ป้อนเงินด้วยนะจร๊...');
                    } else if (txPerson.text.length == 0) {
                      // แสดง dialog เตือน
                      showWarningDialog(context, 'ป้อนคนด้วยนะจร๊...');
                    } else {
                      // พร้อมคำนวณ
                      double money = 0, tip = 0, moneyshare = 0;
                      int person = 0;

                      // แปลงข้อความที่ป้อนจาก textflild เป็นตัวเลข
                      money = double.parse(txMoney.text);
                      person = int.parse(txPerson.text);

                      if (tipCheck == true) {
                        if (txTip.text.length == 0) {
                          //แสดง dialog เตือน
                          showWarningDialog(context, 'ป้อนเงินทิปด้วยนะจร๊...');
                          return; //ออกจากการทำงาน ไม่ทำที่เหลือเลย
                        } else {
                          tip = double.parse(txTip.text);
                        }
                      }
                      // คำนวณ
                      moneyshare = (money + tip) / person;

                      // ส่งไปแสดงผลที่หน้า show_moneyshare
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ShowMoneyshareUI(
                              money: money,
                              tip: tip,
                              person: person,
                              moneyshare: moneyshare,
                            );
                          },
                        ),
                      );
                    }
                  },
                  child: Text(
                    'คำนวณ',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        50.0,
                      ),
                    ),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      txMoney.text = '';
                      txPerson.text = '';
                      tipCheck = false;
                      txTip.text = '';
                    });
                  },
                  icon: Icon(
                    Icons.refresh,
                  ),
                  label: Text(
                    'ยกเลิก',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        50.0,
                      ),
                    ),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                'Created by CS SAU 2021',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
