namespace HMS
{
	public class Appointment
	{
		public int id, patientId, doctorId;
		public float bill;
		public string tests, medicine, status, patientProblem, doctorNote;

		public Appointment(int id, int patientId, int doctorId, float bill, string tests, string medicine, string status, string patientProblem, string doctorNote)
		{
			this.id = id;
			this.patientId = patientId;
			this.doctorId = doctorId;
			this.bill = bill;
			this.tests = tests;
			this.medicine = medicine;
			this.status = status;
			this.patientProblem = patientProblem;
			this.doctorNote = doctorNote;
		}
	}
}