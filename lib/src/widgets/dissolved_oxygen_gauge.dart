import 'package:flutter/material.dart';
import 'package:circular_progress_gauge_odo/odo.dart';
  
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
          )
        ],
      ),
    );
  }
}