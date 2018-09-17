<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientUnvisitedAppointmentsList.aspx.cs" Inherits="HMS.PatientUnvisitedAppointmentsList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Appointments</title>
    <link rel="stylesheet" href="css/main.css" />
</head>
<body>
    <div class="header">
        <h1>Hospital Management System</h1>
        <h3>Hello, <%=Request.Cookies["loggedUser"]["name"] %></h3>
    </div>
    <div class="menu">
        <ul>
            <li><a href="Patient.aspx">Book Appointment</a></li>
            <li><a href="PatientUnvisitedAppointmentsList.aspx">UnAttended Appointments</a></li>
            <li><a href="PatientVisitedAppointments.aspx">Attended Appointments</a></li>
            <li><a href="ChangePassword.aspx">Change Password</a></li>
            <li><a href="Logout.aspx">Logout</a></li>
        </ul>
    </div>
    <div class="clear"></div>
    <form id="form1" runat="server">
        <div>
            <%
                if (Session["appointment booked"] != null)
                {
            %>
            <p class="success"><%=Session["appointment booked"].ToString() %></p>
            <%      Session["appointment booked"] = null;
                }
            %>
            <h3 class="reportHeading">List of Unattended Appointments</h3>
            <asp:Table ID="patientUnvisitedAppointmentsTable" CssClass="reportTable" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>Problem</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Doctor Name</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Status</asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>
            <label runat="server" id="noAppointmentsMessage"></label>
        </div>
    </form>
</body>
</html>
