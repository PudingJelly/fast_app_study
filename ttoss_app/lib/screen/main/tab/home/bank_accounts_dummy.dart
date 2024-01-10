import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 =
    BankAccount(bankShinhan, 3000000, accountTypeName: "신한 주거래 우대통장(저축예금)");
final bankAccountShinhan2 =
    BankAccount(bankShinhan, 30000000, accountTypeName: "저축예금");
final bankAccountShinhan3 =
    BankAccount(bankShinhan, 300000, accountTypeName: "저축예금");
final bankAccountToss = BankAccount(bankToss, 500000);
final bankAccountKakao =
    BankAccount(bankKakao, 1000000, accountTypeName: "입출금통장");

main() {
  // print(bankAccounts[0].accountTypeName);
  //
  // for (final item in bankAccounts) {
  //   print(item.accountTypeName);
  // }
  final shinhanBank = bankMap["shinhan1"];
  // print(shinhanBank == bankAccountShinhan1);

  for(final entry in bankMap.entries) {
    print("${entry.key}:${entry.value.accountTypeName ?? entry.value.bank.name}");
  }

  print(bankSet.contains(bankAccountShinhan1));

  print(bankAccounts.contains(bankAccountShinhan1));

  // List contains와 Set contains의 차이
  // List는 모든 리스트를 한바퀴 돌고 나서 값의 존재유무 파악,
  // Set은 단순히 값의 존재유무 바로 파악 가능
  // 결국 로직 속도의 차이

  // List와 Map,Set의 차이 => List는 중복 허용, Map,Set은 중복 허용X

  // List를 Set으로 변환
  bankAccounts.toSet();
  // Set을 List로 변환
  bankSet.toList();
}
// List
final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao,
];

// Map
final bankMap = {
  "shinhan1": bankAccountShinhan1,
  "shinhan2": bankAccountShinhan2,
  "shinhan3": bankAccountShinhan3,
  'toss': bankAccountToss,
  'kakao': bankAccountKakao,
};

// Set
final bankSet = {
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao,
};
