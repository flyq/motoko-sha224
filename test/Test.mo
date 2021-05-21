import M "mo:matchers/Matchers";
import Library "../src/Library";
import S "mo:matchers/Suite";
import T "mo:matchers/Testable";
import SHA "mo:sha256/SHA256";
import Debug "mo:base/Debug";
import Array "mo:base/Array";
import Nat8 "mo:base/Nat8";

let ParamsInit = S.suite("ParamsInit", do {
  Debug.print("ParamsInit");
  var tests : [S.Suite] = [];

  let data : [Nat8] = [
      072, 105, 115, 032, 109, 111, 110, 101,
      121, 032, 105, 115, 032, 116, 119, 105,
      099, 101, 032, 116, 097, 105, 110, 116,
      101, 100, 058, 032, 039, 116, 097, 105,
      110, 116, 032, 121, 111, 117, 114, 115,
      032, 097, 110, 100, 032, 039, 116, 097,
      105, 110, 116, 032, 109, 105, 110, 101,
      046,
    ];
  let expect : [Nat8] = [
      128, 001, 241, 144, 223, 181, 039, 038,
      028, 076, 252, 171, 112, 201, 142, 128,
      151, 167, 161, 146, 033, 041, 188, 064,
      150, 149, 014, 087, 199, 153, 154, 090,
    ];
  let hash = SHA.sha256(data);
  tests := Array.append(tests, [S.test("ok", Array.equal(expect, hash, Nat8.equal), M.equals(T.bool(true)))]);
  tests
});

let suite = S.suite("sha", [
  ParamsInit
]);

S.run(suite);
