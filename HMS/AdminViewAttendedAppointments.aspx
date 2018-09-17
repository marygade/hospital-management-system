<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminViewAttendedAppointments.aspx.cs" Inherits="HMS.AdminViewAttendedAppointments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Attended Appointments</title>
    <link rel="stylesheet" href="css/main.css" />
</head>
<body>
    <div class="header">
        <h1>Hospital Management System</h1>
        <h3>Hello, <%=Request.Cookies["loggedUser"]["name"] %></h3>
    </div>
    <div class="menu">
        <ul>
            <li><a href="AddDoctor.aspx">Add Doctor</a></li>
            <li><a href="AddMedicalRepresentative.aspx">Add Medical Representative</a></li>
            <li><a href="ViewDoctors.aspx">Doctors</a></li>
            <li><a href="ViewMedicalRepresentatives.aspx">Medical Representatives</a></li>
            <li><a href="AdminViewAttendedAppointments.aspx">Attended Appointments</a></li>
            <li><a href="AdminViewUnattendedAppointments.aspx">UnAttended Appointments</a></li>
            <li><a href="ChangePassword.aspx">Change Password</a></li>
            <li><a href="Logout.aspx">Logout</a></li>
        </ul>
    </div>
    <div class="clear"></div>
    <form id="form1" runat="server">
        <div>
            <h3 class="reportHeading">List of Attended Appointments</h3>
            <asp:Table ID="attendedAppointmentsTable" runat="server" CssClass="reportTable">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>Problem</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Doctor Name</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Patient Name</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Doctor Note</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Medicine</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Tests</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Bill</asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>

            <label id="noAppointmentsMessage" runat="server"></label>
        </div>
    </form>
</body>
</html>
