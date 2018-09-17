using System;

namespace HMS
{
	public partial class Logout : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			Request.Cookies["loggedUser"].Expires = DateTime.Now.AddDays(-1);
			Session.Abandon();
			Response.Redirect("index.aspx");
		}
	}
}