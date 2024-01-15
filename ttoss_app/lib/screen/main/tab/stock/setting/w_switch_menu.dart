import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_os_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchMenu extends StatelessWidget {
  final String title;
  final bool isOn;

  // final void Function(bool isOn) onTap;
  final ValueChanged<bool> onChanged; // == final void Function(bool isOn) onTap;

  const SwitchMenu(this.title, this.isOn, {super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.text.bold.make(),
        emptyExpended,
        OsSwitch(value: isOn, onChanged: onChanged),
      ],
    ).p(20);
  }
}
