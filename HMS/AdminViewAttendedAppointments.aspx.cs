using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMS
{
	public partial class AdminViewAttendedAppointments : System.Web.UI.Page
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
				if (appointment.status.Equals("visited") || appointment.status.Equals("billed"))
				{
					filteredAppointments.Add(appointment);
				}
			}
			if (filteredAppointments.Count == 0)
			{
				attendedAppointmentsTable.Visible = false;
				noAppointmentsMessage.Visible = true;
				noAppointmentsMessage.InnerText = "There are no attended appointments";
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
						TableCell cell4 = new TableCell();
						cell4.Text = appointment.doctorNote;
						TableCell cell5 = new TableCell();
						cell5.Text = appointment.medicine;
						TableCell cell6 = new TableCell();
						cell6.Text = appointment.tests;
						TableCell cell7 = new TableCell();
						cell7.Text = appointment.bill.ToString();

						row.Cells.Add(cell1);
						row.Cells.Add(cell2);
						row.Cells.Add(cell3);
						row.Cells.Add(cell4);
						row.Cells.Add(cell5);
						row.Cells.Add(cell6);
						row.Cells.Add(cell7);

						attendedAppointmentsTable.Rows.Add(row);
					}
				}
			}
		}
	}
}