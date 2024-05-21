import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import '/app/shared/themes/theme.dart';

class CouponButton extends StatefulWidget {
  const CouponButton({Key? key}) : super(key: key);

  @override
  _CouponButtonState createState() => _CouponButtonState();
}

class _CouponButtonState extends State<CouponButton> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.34,
      height: MediaQuery.of(context).size.height * 0.09,
      child: FloatingActionButton(
        backgroundColor: _isClicked ? secondaryColor : buttonColor,
        onPressed: () {
          setState(() {
            _isClicked = true;
          });
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