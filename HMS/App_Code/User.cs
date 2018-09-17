namespace HMS
{
	public class User
	{
		public int id, salary, consultationFee;
		public string name, email, type, password, expertiseArea;

		public User(int id, string name, string email, string type, int salary, string password, string expertiseArea, int consultationFee)
		{
			this.id = id;
			this.name = name;
			this.email = email;
			this.type = type;
			this.salary = salary;
			this.password = password;
			this.expertiseArea = expertiseArea;
			this.consultationFee = consultationFee;
		}
	}
}