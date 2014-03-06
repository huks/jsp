package test.action;

public class Main {
	public static void main(String []  args){
		try{
			Class name = Class.forName("test.action.SubTest1"); // 문자열 값에 따라 생성되는 클래스가 다르다.
			Object obj = name.newInstance(); // name 안에 있는 객체를 생성한다...
			// Object obj = new SubTest1(); 위의 두 줄과 같은 기능. 그런데 이렇게 하는 이유는 위의 스트링 값을 마음대로 넣을 수 있다.
			Super s1 = (Super)obj; // 형 변환
			String view = s1.action();
			System.out.println(view);
		}catch(Exception e){
			
		}
		
	}
}
