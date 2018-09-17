using System;

namespace HMS
{
	public partial class Patient : System.Web.UI.Page
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
				if (!user.type.Equals("patient"))
				{
					Response.Redirect("index.aspx");
				}
			}
		}

		protected void bookAppointment_Click(object sender, EventArgs e)
		{
			int doctorId = int.Parse(doctorsList.SelectedValue);
			User user = (User) Session["user"];
			int patientId = user.id;
			Database db = new Database();
			Appointment appointment = new Appointment(-1, patientId, doctorId, 0, "", "", "not visited", patientProblem.Text, "");
			if(db.registerAppointment(appointment))
			{
				Session["appointment booked"] = "Appointment booked successfully";
				Response.Redirect("PatientUnvisitedAppointmentsList.aspx");
			}
			else
			{
				errorMessage.InnerText = "Please try again";
			}
		}
	}
}