import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue : Float = 300;
  currentValue := 300;

  // Debug.print(debug_show (currentValue));

  stable var startTime = Time.now();
  startTime := Time.now();

  // topUp() method:=
  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  // Withdraw() method:=
  public func withdraw(amount : Float) {
    let tempValue : Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("The amount is less than the withdrawal amount!!!");
    };
  };

  // Check the balance :=
  public query func checkBalance() : async Float {
    return currentValue;
  };

  // Calculating the compound interest on the deposited amount
  public func compound() {
    let currentTime = Time.now();
    let timeElaspedNS = currentTime - startTime;
    let timeElaspedS = timeElaspedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElaspedS));
    startTime := currentTime;
  };
};
