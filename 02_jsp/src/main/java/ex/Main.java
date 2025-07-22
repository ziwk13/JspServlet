package ex;

public class Main {

  public static void main(String[] args) {

    String[] seoul = {"Jane", "Kim"};
    for(int i = 0; i < seoul.length; i++) {
      if(seoul[i] == "Kim") {
        System.out.println("김서방은" + i + "에 있다.");
      }
    }
  }
}
