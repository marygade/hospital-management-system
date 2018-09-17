using System;
using System.Web.UI.WebControls;

namespace HMS
{
	public partial class index : System.Web.UI.Page
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

		protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
		{
			Database db = new Database();
			User user = db.login(Login1.UserName, Login1.Password);
			if (user != null)
			{
				Response.Cookies["loggedUser"]["name"] = user.name;
				Response.Cookies["loggedUser"]["email"] = user.email;
				Response.Cookies["loggedUser"].Expires = DateTime.Now.AddDays(1);

				Session["user"] = user;
				Session["type"] = user.type;

				if(user.type.Equals("doctor"))
				{
					Response.Redirect("Doctor.aspx");
				}
				else if(user.type.Equals("admin"))
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
			else
			{
				errorMessage.InnerText = "Incorrect username / password";
			}
		}
	}
}