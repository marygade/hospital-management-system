<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Doctor.aspx.cs" Inherits="HMS.Doctor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Doctor</title>
    <link rel="stylesheet" href="css/main.css" />
</head>
<body>
    <div class="header">
        <h1>Hospital Management System</h1>
        <h3>Hello, <%=Request.Cookies["loggedUser"]["name"] %></h3>
    </div>
    <div class="menu">
        <ul>
            <li><a href="Doctor.aspx">Pending Appointments</a></li>
            <li><a href="AttendedAppointments.aspx">Attended Appointments</a></li>
            <li><a href="ChangePassword.aspx">Change Password</a></li>
            <li><a href="Logout.aspx">Logout</a></li>
        </ul>
    </div>
    <div class="clear"></div>
    <form id="form1" runat="server">
    <div>
        <h3 class="reportHeading">List of UnAttended Appointments</h3>
        <asp:Table ID="doctorUnvisitedAppointmentsTable" CssClass="reportTable" runat="server">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>Problem</asp:TableHeaderCell>
                <asp:TableHeaderCell>Patient Name</asp:TableHeaderCell>
                <asp:TableHeaderCell></asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
        <label runat="server" id="noAppointmentsMessage"></label>
    </div>
    </form>
</body>
</html>
