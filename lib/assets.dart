import 'package:flutter/material.dart';

import 'constants.dart';

class ColorRadiobutton extends StatefulWidget {
  ColorRadiobutton({Key key}) : super(key: key);

  @override
  _ColorRadiobuttonState createState() => _ColorRadiobuttonState();
}

class _ColorRadiobuttonState extends State<ColorRadiobutton> {
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 1;
  }

  setSelectedRadio(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Radio(
            value: 1,
            groupValue: selectedRadio,
            activeColor: Colors.black,
            visualDensity: VisualDensity(vertical: -4.0),
            onChanged: (val) {
              setSelectedRadio(val);
            },
          ),
          Radio(
            value: 2,
            groupValue: selectedRadio,
            visualDensity: VisualDensity(vertical: -4.0),
            fillColor:
                MaterialStateColor.resolveWith((states) => Colors.yellow[400]),
            activeColor: Colors.yellow[400],
            onChanged: (val) {
              setSelectedRadio(val);
            },
          ),
          Radio(
            value: 3,
            groupValue: selectedRadio,
            visualDensity: VisualDensity(vertical: -4.0),
            fillColor:
                MaterialStateColor.resolveWith((states) => Colors.pink[100]),
            activeColor: Colors.pink[100],
            onChanged: (val) {
              setSelectedRadio(val);
            },
          ),
          Radio(
            value: 4,
            groupValue: selectedRadio,
            visualDensity: VisualDensity(vertical: -4.0),
            fillColor:
                MaterialStateColor.resolveWith((states) => Colors.grey[400]),
            activeColor: Colors.grey[400],
            onChanged: (val) {
              setSelectedRadio(val);
            },
          ),
        ],
      ),
    );
  }
}

//detial_product_view
sizebutton(String size) {
  return ButtonTheme(
    minWidth: 5.0,
    child: RaisedButton(
      visualDensity: VisualDensity(horizontal: -1.0, vertical: -4.0),
      child: Text(
        size,
      ),
      color: Colors.white,
      onPressed: () {},
    ),
  );
}

//Nested_tabbar
addcardbutton() {
  return ButtonTheme(
    minWidth: double.infinity,
    height: 50.0,
    child: RaisedButton(
      child: Text(
        addcard,
        style: TextStyle(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Colors.black,
      elevation: 0.0,
      onPressed: () {},
    ),
  );
}

const shopping_cart = Icon(
  Icons.shopping_cart,
  color: Colors.black,
  size: 30.0,
);

const share = Icon(
  Icons.share,
  color: Colors.black,
  size: 30.0,
);

const arrow_back = Icon(
  Icons.arrow_back,
  size: 30,
  color: Colors.black,
);
