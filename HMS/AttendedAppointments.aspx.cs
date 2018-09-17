using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace HMS
{
	public partial class AttendedAppointments : System.Web.UI.Page
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
				if (appointment.doctorId == doctor.id && (appointment.status.Equals("visited") || appointment.status.Equals("billed")))
				{
					filteredAppointments.Add(appointment);
				}
			}
			if (filteredAppointments.Count == 0)
			{
				doctorVisitedAppointmentsTable.Visible = false;
				noAppointmentsMessage.Visible = true;
				noAppointmentsMessage.InnerText = "You have no completed appointments";
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
						cell2.Text = doctor.name;
						TableCell cell3 = new TableCell();
						cell3.Text = appointment.doctorNote;
						TableCell cell4 = new TableCell();
						cell4.Text = appointment.medicine;
						TableCell cell5 = new TableCell();
						cell5.Text = appointment.tests;

						row.Cells.Add(cell1);
						row.Cells.Add(cell2);
						row.Cells.Add(cell3);
						row.Cells.Add(cell4);
						row.Cells.Add(cell5);

						doctorVisitedAppointmentsTable.Rows.Add(row);
					}
				}
			}
		}
	}
}