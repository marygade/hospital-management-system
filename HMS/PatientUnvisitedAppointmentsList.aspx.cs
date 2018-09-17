using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace HMS
{
	public partial class PatientUnvisitedAppointmentsList : System.Web.UI.Page
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

			noAppointmentsMessage.Visible = false;
			user = (User)Session["user"];
			Database db = new Database();
			List<Appointment> allAppointments = db.getAllAppointments();
			List<Appointment> filteredAppointments = new List<Appointment>();

			foreach (Appointment appointment in allAppointments)
			{
				if (appointment.patientId == user.id && appointment.status.Equals("not visited"))
				{
					filteredAppointments.Add(appointment);
				}
			}

			if (filteredAppointments.Count == 0)
			{
				patientUnvisitedAppointmentsTable.Visible = false;
				noAppointmentsMessage.Visible = true;
				noAppointmentsMessage.InnerText = "You have no pending appointments";
			}
			else
			{
				foreach (Appointment appointment in filteredAppointments)
				{
					User doctor = db.getUserById(appointment.doctorId);
					if (doctor != null)
					{
						TableRow row = new TableRow();
						TableCell cell1 = new TableCell();
						cell1.Text = appointment.patientProblem;
						TableCell cell2 = new TableCell();
						cell2.Text = doctor.name;
						TableCell cell3 = new TableCell();
						cell3.Text = appointment.status;

						row.Cells.Add(cell1);
						row.Cells.Add(cell2);
						row.Cells.Add(cell3);

						patientUnvisitedAppointmentsTable.Rows.Add(row);
					}
				}
			}
		}
	}
}