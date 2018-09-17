using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMS
{
	public partial class AdminViewUnattendedAppointments : System.Web.UI.Page
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

			noAppointmentsMessage.Visible = false;
			Database db = new Database();
			List<Appointment> allAppointments = db.getAllAppointments();
			List<Appointment> filteredAppointments = new List<Appointment>();

			foreach (Appointment appointment in allAppointments)
			{
				if (appointment.status.Equals("not visited"))
				{
					filteredAppointments.Add(appointment);
				}
			}
			if (filteredAppointments.Count == 0)
			{
				unattendedAppointmentsTable.Visible = false;
				noAppointmentsMessage.Visible = true;
				noAppointmentsMessage.InnerText = "There are no unattended appointments";
			}
			else
			{
				foreach (Appointment appointment in filteredAppointments)
				{
					User patient = db.getUserById(appointment.patientId);
					User doctor = db.getUserById(appointment.doctorId);
					if (patient != null && doctor != null)
					{
						TableRow row = new TableRow();
						TableCell cell1 = new TableCell();
						cell1.Text = appointment.patientProblem;
						TableCell cell2 = new TableCell();
						cell2.Text = doctor.name;
						TableCell cell3 = new TableCell();
						cell3.Text = patient.name;

						row.Cells.Add(cell1);
						row.Cells.Add(cell2);
						row.Cells.Add(cell3);

						unattendedAppointmentsTable.Rows.Add(row);
					}
				}
			}
		}
	}
}