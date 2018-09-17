using System;

namespace HMS
{
	public partial class Registration : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			User user = null;
			if (Session["user"] == null)
			{

			}
			else
			{
				user = (User)Session["user"];
				if (user.type.Equals("doctor"))
				{
					Response.Redirect("Doctor.aspx");
				}
				else if (user.type.Equals("admin"))
				{
					Response.Redirect("AddDoctor.aspx");
				}
				else if (user.type.Equals("medical"))
				{
					Response.Redirect("UnbilledAppointments.aspx");
				}
				else if (user.type.Equals("patient"))
				{
					Response.Redirect("Patient.aspx");
				}
			}
		}

		protected void register_Click(object sender, EventArgs e)
		{
			string un = userName.Text;
			string em = email.Text;
			string pw = password.Text;

			Database db = new Database();
			if(db.emailExist(em))
			{
				errorMessage.InnerText = "Email already exist";
			}
			else if(db.addUser(un, em, "patient", 0, pw, "", 0))
			{
				Session["registration success"] = "Registration successfull";
				Response.Redirect("index.aspx");
			}
			else
			{
				errorMessage.InnerText = "Please try again";
			}
		}
	}
}