using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace HMS
{
	public partial class Doctor : System.Web.UI.Page
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
				if (!user.type.Equals("doctor"))
				{
					Response.Redirect("index.aspx");
				}
			}

			noAppointmentsMessage.Visible = false;
			User doctor = (User)Session["user"];
			Database db = new Database();
			List<Appointment> allAppointments = db.getAllAppointments();
			List<Appointment> filteredAppointments = new List<Appointment>();

			foreach (Appointment appointment in allAppointments)
			{
				if (appointment.doctorId == doctor.id && appointment.status.Equals("not visited"))
				{
					filteredAppointments.Add(appointment);
				}
			}

			if (filteredAppointments.Count == 0)
			{
				doctorUnvisitedAppointmentsTable.Visible = false;
				noAppointmentsMessage.Visible = true;
				noAppointmentsMessage.InnerText = "You have no pending appointments";
			}
			else
			{
				foreach (Appointment appointment in filteredAppointments)
				{
					User patient = db.getUserById(appointment.patientId);
					if (patient != null)
					{
						TableRow row = new TableRow();
						TableCell cell1 = new TableCell();
						cell1.Text = appointment.patientProblem;
						TableCell cell2 = new TableCell();
						cell2.Text = patient.name;
						TableCell cell3 = new TableCell();
						string enc = Server.UrlEncode(appointment.id.ToString());
						cell3.Text = "<a href='Attend.aspx?id=" + enc + "'>Attend</a>";

						row.Cells.Add(cell1);
						row.Cells.Add(cell2);
						row.Cells.Add(cell3);

						doctorUnvisitedAppointmentsTable.Rows.Add(row);
					}
				}
			}
		}
	}
}