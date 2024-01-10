import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank.dart';

class BankAccount {
  // 변하지 않는것은 final 선언
  // 잔액같이 변함이 있는것들은 일반 선언
  final Bank bank;
  int balance;
  final String? accountTypeName;

  BankAccount(
    this.bank,
    this.balance, {
    this.accountTypeName, //null일 수 있는 경우 optional로 선언
  });
}
