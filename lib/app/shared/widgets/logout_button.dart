import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import '../themes/theme.dart';

class LogoutButton extends StatelessWidget {
  final Icon leadingIcon;
  final String title;
  final VoidCallback onTap;

  const LogoutButton({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          onTap: onTap,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InnerShadow(
                blur: 1,
                color: Colors.black.withOpacity(0.8),
                offset: const Offset(0, 0),
                child: Icon(
                  leadingIcon.icon,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 3.0, height: 0.1),
              InnerShadow(
                blur: 1,
                color: Colors.black.withOpacity(0.8),
                offset: const Offset(0, 0),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
