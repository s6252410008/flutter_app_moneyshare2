import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoneyshareUI extends StatefulWidget {
  const MoneyshareUI({ Key? key }) : super(key: key);

  @override
  _MoneyshareUIState createState() => _MoneyshareUIState();
}

class _MoneyshareUIState extends State<MoneyshareUI> {
  bool tipCheck = false;
  TextEditingController txMoney = TextEditingController();
  TextEditingController txPerson = TextEditingController();
  TextEditingController txTip = TextEditingController();

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
                        if (data != null){
                          tipCheck = data;
                          if (data == false){
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
                    onPressed: (){},
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
                      fixedSize:  Size(
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
                  
                  onPressed: (){},
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
            ],
          ),
        ),
      ),
    );
  }
}