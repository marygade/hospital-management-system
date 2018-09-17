using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace HMS
{
	public class Database
	{
		private string CS = ConfigurationManager.ConnectionStrings["HMS"].ToString();

		private int insertOrUpdate(string sql)
		{
			try
			{
				using (SqlConnection connection = new SqlConnection(CS))
				{
					connection.Open();
					using (SqlCommand command = connection.CreateCommand())
					{
						command.CommandText = sql;
						return command.ExecuteNonQuery();
					}
				}
			}
			catch (Exception e)
			{
				return -1;
			}
		}
		
		public User getUserById(int id)
		{
			User user = null;
			string sql = @"select id, name, email, password, type, salary, expertise_area, consultation_fee 
							from users where id = " + id;
			using (SqlConnection connection = new SqlConnection(CS))
			{
				connection.Open();
				using (SqlCommand command = connection.CreateCommand())
				{
					command.CommandText = sql;
					using (SqlDataReader reader = command.ExecuteReader())
					{
						if (reader.Read())
						{
							string name = reader["name"].ToString();
							string type = reader["type"].ToString();
							string email = reader["email"].ToString();
							string password = reader["password"].ToString();
							int salary = 0;
							if(reader["salary"].ToString().Trim().Length > 0)
							{
								salary = int.Parse(reader["salary"].ToString());
							}
							string expertiseArea = reader["expertise_area"].ToString();
							int consultationFee = 0;
							if(reader["consultation_fee"].ToString().Trim().Length > 0)
							{
								consultationFee = int.Parse(reader["consultation_fee"].ToString());
							}
							user = new User(id, name, email, type, salary, password, expertiseArea, consultationFee);
						}
					}
				}
			}
			return user;
		}

		public bool emailExist(string email)
		{
			bool exist = false;
			string sql = "select * from users where email = '" + email + "'";
			using (SqlConnection connection = new SqlConnection(CS))
			{
				connection.Open();
				using (SqlCommand command = connection.CreateCommand())
				{
					command.CommandText = sql;
					using (SqlDataReader reader = command.ExecuteReader())
					{
						if (reader.Read())
						{
							exist = true;
						}
					}
				}
			}
			return exist;
		}

		public bool addUser(string name, string email, string type, float salary, string password, string expertiseArea, int consultationFee)
		{
			string sql = @"insert into users (name, email, type, password, salary, expertise_area, consultation_fee) 
							values('" + name + "', '" + email + "', '" + type + "', '" + password + "', '" + salary + "', '" + expertiseArea + "', " + consultationFee + ")";
			return insertOrUpdate(sql) == 1;
		}
	
		public bool changePassword(string email, string newPassword)
		{
			string sql = @"update users set password = '" + newPassword + "' where email = '" + email + "'";
			return insertOrUpdate(sql) == 1;
		}
	
		public User login(string email, string password)
		{
			User user = null;
			string sql = @"select id, name, type, salary, expertise_area, consultation_fee 
							from users where email = '" + email + "' and password = '" + password + "'";
			using(SqlConnection connection = new SqlConnection(CS))
			{
				connection.Open();
				using(SqlCommand command = connection.CreateCommand())
				{
					command.CommandText = sql;
					using(SqlDataReader reader = command.ExecuteReader())
					{
						if(reader.Read())
						{
							int id = int.Parse(reader["id"].ToString());
							string name = reader["name"].ToString();
							string type = reader["type"].ToString();
							int salary = 0;
							if(reader["salary"].ToString().Trim().Length > 0)
							{
								salary = int.Parse(reader["salary"].ToString());
							}
							string expertiseArea = "";
							if(reader["expertise_area"].ToString().Trim().Length > 0)
							{
								expertiseArea = reader["expertise_area"].ToString();
							}
							int consultationFee = 0;
							if(reader["consultation_fee"].ToString().Trim().Length > 0)
							{
								consultationFee = int.Parse(reader["consultation_fee"].ToString());
							}
							user = new User(id, name, email, type, salary, password, expertiseArea, consultationFee);
						}
					}
				}
			}
			return user;
		}
	
		public bool registerAppointment(Appointment appointment)
		{
			string sql = @"insert into appointments (patient_id, doctor_id, status, patient_problem)
						values(" + appointment.patientId + ", " + appointment.doctorId + ", 'not visited', '" + appointment.patientProblem +"')";
			return insertOrUpdate(sql) == 1;
		}
	
		public List<Appointment> getAllAppointments()
		{
			List<Appointment> appointments = new List<Appointment>();
			string sql = @"select id, patient_id, doctor_id, bill, tests, medicine, status, doctor_note, patient_problem
							from appointments order by id desc";
			using (SqlConnection connection = new SqlConnection(CS))
			{
				connection.Open();
				using (SqlCommand command = connection.CreateCommand())
				{
					command.CommandText = sql;
					using (SqlDataReader reader = command.ExecuteReader())
					{
						while (reader.Read())
						{
							int id = int.Parse(reader["id"].ToString());
							int patientId = int.Parse(reader["patient_id"].ToString());
							int doctorId = int.Parse(reader["doctor_id"].ToString());
							float bill = 0;
							if (reader["bill"].ToString().Trim().Length > 0)
							{
								bill = float.Parse(reader["bill"].ToString());
							}
							string tests = reader["tests"].ToString();
							string medicine = reader["medicine"].ToString();
							string status = reader["status"].ToString();
							string doctorNote = reader["doctor_note"].ToString();
							string patientProblem = reader["patient_problem"].ToString();

							Appointment appointment = new Appointment(id, patientId, doctorId, bill, tests, medicine, status, patientProblem, doctorNote);
							appointments.Add(appointment);
						}
					}
				}
			}
			return appointments;
		}

		public Appointment getAppointmentById(int id)
		{
			Appointment appointment = null;
			List<Appointment> allAppointments = getAllAppointments();
			foreach(Appointment ap in allAppointments)
			{
				if(ap.id == id)
				{
					appointment = ap;
					break;
				}
			}
			return appointment;
		}
	
		public bool generateBillForAppointment(int appointmentId, float bill)
		{
			string sql = @"update appointments set bill = " + bill + ", status = 'billed' where id = " + appointmentId;
			return insertOrUpdate(sql) == 1;
		}
	
		public bool givePrescription(int appointmentId, string tests, string medicine, string doctorNote)
		{
			string sql = @"update appointments set status='visited', tests = '" + tests + "', medicine = '" + medicine + "', doctor_note = '" + doctorNote + "'" +
				 "where id = " + appointmentId;
			return insertOrUpdate(sql) == 1;
		}
	}
}