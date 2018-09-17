using System;

namespace HMS
{
	public partial class BillAppointment : System.Web.UI.Page
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
				if (!user.type.Equals("medical"))
				{
					Response.Redirect("index.aspx");
				}
			}


			if (Request.QueryString["id"] == null)
			{
				Response.Redirect("UnbilledAppointments.aspx");
			}
			else
			{
				int appointmentId = 0;
				if (int.TryParse(Request.QueryString["id"], out appointmentId))
				{
					Database db = new Database();
					Appointment appointment = db.getAppointmentById(appointmentId);
					if (appointment == null)
					{
						Response.Redirect("UnbilledAppointments.aspx");
					}
					else
					{
						User patient = db.getUserById(appointment.patientId);
						User doctor = db.getUserById(appointment.doctorId);
						if(patient == null || doctor == null)
						{
							Response.Redirect("UnbilledAppointments.aspx");
						}
						else
						{
							patientProblem.Text = appointment.patientProblem;
							patientName.InnerText = patient.name;
							doctorName.InnerText = doctor.name;
							consultationFee.Text = doctor.consultationFee.ToString();
							doctorNote.Text = appointment.doctorNote;
							medicine.Text = appointment.medicine;
							tests.Text = appointment.tests;
						}
					}
				}
				else
				{
					Response.Redirect("UnbilledAppointments.aspx");
				}
			}
		}

		protected void postBill_Click(object sender, EventArgs e)
		{
			Database db = new Database();
			int consulFee = 0;
			if(consultationFee.Text.Trim().Length > 0)
			{
				consulFee = int.Parse(consultationFee.Text);
			}
			float medFee = 0;
			if (medicineBill.Text.Trim().Length > 0)
			{
				medFee = float.Parse(medicineBill.Text);
			}
			float tesFee = 0;
			if (testsBill.Text.Trim().Length > 0)
			{
				tesFee = float.Parse(testsBill.Text);
			}
			int appointmentId = int.Parse(Request.QueryString["id"]);
			float totalBill = consulFee + medFee + tesFee;

			if(db.generateBillForAppointment(appointmentId, totalBill))
			{
				Session["appointment billed"] = "Appointment billed successfully";
				Response.Redirect("UnbilledAppointments.aspx");
			}
			else
			{
				errorMessage.InnerText = "Please try again";
			}
		}
	}
}