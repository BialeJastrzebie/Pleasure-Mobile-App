import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import 'package:pleasure_mobile_app/app/screens/login/login_page.dart';
import '/app/shared/themes/theme.dart';

class CouponButton extends StatefulWidget {
  final String markerId;
  const CouponButton({super.key, required this.markerId});

  @override
  _CouponButtonState createState() => _CouponButtonState();
}

class _CouponButtonState extends State<CouponButton> {
  bool _isClicked = false;

  @override
  void initState() {
    super.initState();
    checkIfReceived(widget.markerId).then((value) {
      setState(() {
        _isClicked = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkIfReceived(widget.markerId),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(buttonColorMenu),
                backgroundColor: secondaryColor,
                strokeCap: StrokeCap.round,
                strokeWidth: 6,
              ),
            ],
          );
        } else {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            _isClicked = snapshot.data ?? false;
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.34,
              height: MediaQuery.of(context).size.height * 0.09,
              child: FloatingActionButton(
                backgroundColor: _isClicked ? secondaryColor : buttonColor,
                onPressed: () async {
                  if(_isClicked) {
                    return;
                  }
                  addToReceived(widget.markerId);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.0),
                ),
                elevation: 5,
                child: InnerShadow(
                  blur: 1,
                  color: Colors.black12,
                  offset: const Offset(0, 2),
                  child: Center(
                    child: Text(
                      _isClicked ? 'Odebrano' : 'Odbierz',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black12,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        }
      },
    );
  }

  Future<bool> checkIfReceived(String markerId) async {
    final value = await fetchData('http://localhost:8000/api/user/me');
    for (var element in value['coupon_received_locations']) {
      final locationValue =
      await fetchData('http://localhost:8000/api/map/locations/$element');
      if (locationValue['name'] == markerId) {
        return true;
      }
    }
    return false;
  }

  Future<void> addToReceived(String markerId) async {
    int markerPk = 0;
    var value = await fetchData(
        'http://localhost:8000/api/map/locations/');
    for (var element in value) {
      if (element['name'] == markerId) {
        markerPk = element['id'];
      }
    }

    value = await fetchData(
        'http://localhost:8000/api/user/me');
    var receivedLocations = value['coupon_received_locations'];

    receivedLocations.add(markerPk);

    await patchData(
        'http://localhost:8000/api/user/me/', {
      'coupon_received_locations': receivedLocations,
    });
    setState(() {
        _isClicked = true;
    });
  }
}