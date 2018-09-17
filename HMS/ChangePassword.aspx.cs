using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMS
{
	public partial class ChangePassword : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			User user = null;
			if (Session["user"] == null)
			{
				Response.Redirect("index.aspx");
			}
			else
			{
				user = (User)Session["user"];
			}
		}

		protected void changePassword_Click(object sender, EventArgs e)
		{
			User user = (User) Session["user"];
			Database db = new Database();
			if(user.password.Equals(currentPassword.Text))
			{
				if (db.changePassword(user.email, newPassword.Text))
				{
					user.password = newPassword.Text;
					Session["user"] = user;
					successMessage.InnerText = "Password changed successfully";
				}
				else
				{
					errorMessage.InnerText = "Please try again";
				}
			}
			else
			{
				errorMessage.InnerText = "Incorrect password";
			}
		}
	}
}