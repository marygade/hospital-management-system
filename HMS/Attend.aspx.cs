using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMS
{
	public partial class Attend : System.Web.UI.Page
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

			if (Request.QueryString["id"] == null)
			{
				Response.Redirect("Doctor.aspx");
			}
			else
			{
				int appointmentId = 0;
				if(int.TryParse(Request.QueryString["id"], out appointmentId))
				{
					Database db = new Database();
					Appointment appointment = db.getAppointmentById(appointmentId);
					if(appointment == null)
					{
						Response.Redirect("Doctor.aspx");
					}
					else
					{
						patientProblem.Text = appointment.patientProblem;
						User patient = db.getUserById(appointment.patientId);
						patientName.InnerText = patient.name;
					}
				}
				else
				{
					Response.Redirect("Doctor.aspx");
				}
			}
		}

		protected void postPrescription_Click(object sender, EventArgs e)
		{
			int appointmentId = int.Parse(Request.QueryString["id"]);
			Database db = new Database();
			if(db.givePrescription(appointmentId, tests.Text, medicine.Text, doctorNote.Text))
			{
				Session["appointment attended"] = "Prescription posted successfully";
				Response.Redirect("AttendedAppointments.aspx");
			}
			else
			{
				errorMessage.InnerText = "Please try again";
			}
		}
	}
}