using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMS
{
	public partial class AddDoctor : System.Web.UI.Page
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
				if(!user.type.Equals("admin"))
				{
					Response.Redirect("index.aspx");
				}
			}
		}

		protected void addDoctor_Click(object sender, EventArgs e)
		{
			string un = userName.Text;
			string em = email.Text;
			string pw = password.Text;
			int sal = int.Parse(salary.Text);
			string ea = expertiseArea.Text;
			int confee = int.Parse(consultationFee.Text);

			Database db = new Database();
			if (db.emailExist(em))
			{
				errorMessage.InnerText = "Email already exist";
			}
			else if (db.addUser(un, em, "doctor", sal, pw, ea, confee))
			{
				userName.Text = email.Text = password.Text = salary.Text = expertiseArea.Text = consultationFee.Text = string.Empty;
				successMessage.InnerText = "Doctor added successfully";
			}
			else
			{
				errorMessage.InnerText = "Please try again";
			}
		}
	}
}