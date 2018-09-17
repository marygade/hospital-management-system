using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMS
{
	public partial class AddMedicalRepresentative : System.Web.UI.Page
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
				if (!user.type.Equals("admin"))
				{
					Response.Redirect("index.aspx");
				}
			}
		}

		protected void addMedicalRepresentative_Click(object sender, EventArgs e)
		{
			string un = userName.Text;
			string em = email.Text;
			string pw = password.Text;
			int sal = int.Parse(salary.Text);

			Database db = new Database();
			if (db.emailExist(em))
			{
				errorMessage.InnerText = "Email already exist";
			}
			else if (db.addUser(un, em, "medical", sal, pw, "", 0))
			{
				userName.Text = email.Text = password.Text = salary.Text = string.Empty;
				successMessage.InnerText = "Medical Representative added";
			}
			else
			{
				errorMessage.InnerText = "Please try again";
			}
		}
	}
}