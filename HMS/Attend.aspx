<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attend.aspx.cs" Inherits="HMS.Attend" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Attend Appointment</title>
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
    <h3 class="formHeading">Attend an appointment</h3>
    <form id="form1" runat="server">
    <div class="userForm" style="width:30%">
        <label>Problem</label>
        <asp:TextBox ID="patientProblem" runat="server" TextMode="MultiLine" Rows="5" Enabled="false"></asp:TextBox>
        <br />
        <label>Patient Name</label>
        <span runat="server" id="patientName"></span>
        <br />
        <label>Note</label>
        <asp:TextBox ID="doctorNote" runat="server" TextMode="MultiLine" Rows="5" Columns="35"></asp:TextBox>
        <asp:RegularExpressionValidator ID="doctorNoteValidator" runat="server" ErrorMessage="Cannot exceed 200 chars" ForeColor="Red"
            ControlToValidate="doctorNote" Display="Dynamic" ValidationExpression="^[a-zA-Z'.\s]{1,200}"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="doctorNoteReqValidator" runat="server" ErrorMessage="Enter Note" ForeColor="Red"
            ControlToValidate="doctorNote" Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
        <label>Medicine</label>
        <asp:TextBox ID="medicine" runat="server" TextMode="MultiLine" Rows="5" Columns="35"></asp:TextBox>
        <asp:RegularExpressionValidator ID="medicineValidator" runat="server" ErrorMessage="Cannot exceed 200 chars" ForeColor="Red"
            ControlToValidate="medicine" Display="Dynamic" ValidationExpression="^[a-zA-Z'.\s]{1,200}"></asp:RegularExpressionValidator>
        <br />
        <label>Tests</label>
        <asp:TextBox ID="tests" runat="server" TextMode="MultiLine" Rows="5" Columns="35"></asp:TextBox>
        <asp:RegularExpressionValidator ID="testsValidator" runat="server" ErrorMessage="Cannot exceed 200 chars" ForeColor="Red"
            ControlToValidate="tests" Display="Dynamic" ValidationExpression="^[a-zA-Z'.\s]{1,200}"></asp:RegularExpressionValidator>
        <br />
        <asp:Button ID="postPrescription" runat="server" Text="Send Prescription" OnClick="postPrescription_Click" />
        <br />
        <p id="errorMessage" runat="server"></p>
    </div>
    </form>
</body>
</html>
