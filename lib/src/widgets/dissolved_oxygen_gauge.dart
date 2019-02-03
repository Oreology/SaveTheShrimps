import 'package:flutter/material.dart';
import 'package:circular_progress_gauge_odo/odo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
  
class DissolvedOxygenGauge extends StatefulWidget {
  DissolvedOxygenGauge({Key key}) : super(key: key);
  @override
  _DissolvedOxygenGauge createState() => _DissolvedOxygenGauge();
}

class _DissolvedOxygenGauge extends State<DissolvedOxygenGauge> {
  double _value = 0.0;
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Odo(
            size: 300.0,
            inputValue: _value,
            rangeMinValue: 0.0,
            rangeMaxValue: 100.0,
          ),
          Slider(
            value: _value,
            min: 0.0,
            max: 1.0,
            onChanged: (sliderInput) {
              setState(() {
                _value = sliderInput;
              });
            }
          ),
          RaisedButton(
            child: Text('Save the Shrimps'),
            onPressed: storeValue,
            color: Colors.lightBlueAccent,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }

  void storeValue() {
    var batch = Firestore.instance.batch();

    var valRef = Firestore.instance.collection('value').document('value');

    batch.updateData(valRef, { 'value': _value });
    batch.commit();
  }
}