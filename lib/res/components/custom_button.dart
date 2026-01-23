import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:learning/res/app_colors.dart';

class CustomButton extends StatelessWidget {
  //loading
  final bool loading;
  final VoidCallback? onTap;
  final String? title;
  final bool isEnabled;

  const CustomButton({super.key, this.loading = false, this.onTap, this.title, this.isEnabled = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(kDebugMode) {
          print('Custom Button Tapped');
        }
      },
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isEnabled ? Colors.blue: AppColors.lightGray,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: loading ? CircularProgressIndicator(color: AppColors.white,) : Text(
            'Custom Button',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
