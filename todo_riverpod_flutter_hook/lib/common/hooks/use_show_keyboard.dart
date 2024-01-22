import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:flutter/material.dart';
import 'package:nav_hooks/dialog/hook_consumer_dialog.dart';

_useShowKeyboard(BuildContext context, FocusNode node) {
  useMemoized(() {
    AppKeyboardUtil.show(context, node);
  });

  showKeyboard(FocusNode node) {
    final context = useContext();
    _useShowKeyboard(context, node);
  }
}