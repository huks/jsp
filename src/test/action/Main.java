package test.action;

public class Main {
	public static void main(String []  args){
		try{
			Class name = Class.forName("test.action.SubTest1"); // ���ڿ� ���� ���� �����Ǵ� Ŭ������ �ٸ���.
			Object obj = name.newInstance(); // name �ȿ� �ִ� ��ü�� �����Ѵ�...
			// Object obj = new SubTest1(); ���� �� �ٰ� ���� ���. �׷��� �̷��� �ϴ� ������ ���� ��Ʈ�� ���� ������� ���� �� �ִ�.
			Super s1 = (Super)obj; // �� ��ȯ
			String view = s1.action();
			System.out.println(view);
		}catch(Exception e){
			
		}
		
	}
}
