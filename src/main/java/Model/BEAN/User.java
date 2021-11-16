package Model.BEAN;

public class User {

	private int User_ID;

	private String Fullname;
	private boolean Gender;
	private int Age;
	private String Username;
	private String Password;

	public User(int user_ID, String fullname, boolean gender, int age, String username, String password) {
		User_ID = user_ID;
		Fullname = fullname;
		Gender = gender;
		Age = age;
		Username = username;
		Password = password;
	}

	public int getUser_ID() {
		return User_ID;
	}

	public void setUser_ID(int user_ID) {
		User_ID = user_ID;
	}

	public String getFullname() {
		return Fullname;
	}

	public void setFullname(String fullname) {
		Fullname = fullname;
	}

	public boolean isGender() {
		return Gender;
	}

	public void setGender(boolean gender) {
		Gender = gender;
	}

	public int getAge() {
		return Age;
	}

	public void setAge(int age) {
		Age = age;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}
}
