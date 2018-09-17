<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnbilledAppointments.aspx.cs" Inherits="HMS.UnbilledAppointments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bill</title>
    <link rel="stylesheet" href="css/main.css" />
</head>
<body>
    <div class="header">
        <h1>Hospital Management System</h1>
        <h3>Hello, <%=Request.Cookies["loggedUser"]["name"] %></h3>
    </div>
    <div class="menu">
        <ul>
            <li><a href="UnbilledAppointments.aspx">Unbilled Appointments</a></li>
            <li><a href="ChangePassword.aspx">Change Password</a></li>
            <li><a href="Logout.aspx">Logout</a></li>
        </ul>
    </div>
    <div class="clear"></div>
    <form id="form1" runat="server">
        <div>
            <p class="success" runat="server" id="billedMessage"></p>
            <h3 class="reportHeading">List of Unbilled Appointments</h3>
            <asp:Table ID="unbilledAppointmentsTable" CssClass="reportTable" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>Problem</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Doctor Name</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Patient Name</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Doctor Note</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Medicine</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Tests</asp:TableHeaderCell>
                    <asp:TableHeaderCell></asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>

            <label id="noAppointmentsMessage" runat="server"></label>
        </div>
    </form>
</body>
</html>
