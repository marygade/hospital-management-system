using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMS
{
	public partial class PatientVisitedAppointments : System.Web.UI.Page
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
				if (appointment.patientId == user.id && appointment.status.Equals("billed"))
				{
					filteredAppointments.Add(appointment);
				}
			}
			if(filteredAppointments.Count == 0)
			{
				patientVisitedAppointmentsTable.Visible = false;
				noAppointmentsMessage.Visible = true;
				noAppointmentsMessage.InnerText = "You have no completed appointments";
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
						cell3.Text = appointment.doctorNote;
						TableCell cell4 = new TableCell();
						cell4.Text = appointment.medicine;
						TableCell cell5 = new TableCell();
						cell5.Text = appointment.tests;
						TableCell cell6 = new TableCell();
						cell6.Text = appointment.bill.ToString();

						row.Cells.Add(cell1);
						row.Cells.Add(cell2);
						row.Cells.Add(cell3);
						row.Cells.Add(cell4);
						row.Cells.Add(cell5);
						row.Cells.Add(cell6);

						patientVisitedAppointmentsTable.Rows.Add(row);
					}
				}
			}
		}
	}
}