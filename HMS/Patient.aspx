<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patient.aspx.cs" Inherits="HMS.Patient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient</title>
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
    <h3 class="formHeading">Book Appointment</h3>
    <form id="form1" runat="server">
        <div class="userForm" style="width: 30%">
            <label>Problem</label>
            <asp:TextBox ID="patientProblem" runat="server" TextMode="MultiLine" Rows="5" Columns="35" ></asp:TextBox>
            <asp:RegularExpressionValidator ID="problemValidator" runat="server" ErrorMessage="Inavlid Text" ForeColor="Red"
                ControlToValidate="patientProblem" Display="Dynamic" ValidationExpression="^[a-zA-Z'.\s]{1,200}"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="problemReqValidator" runat="server" ErrorMessage="Enter Problem" ForeColor="Red"
                ControlToValidate="patientProblem" Display="Dynamic"></asp:RequiredFieldValidator>
            <br />
            <label>Doctor</label>
            <asp:DropDownList ID="doctorsList" runat="server" DataSourceID="DoctorsListSource" DataTextField="name" DataValueField="Id"></asp:DropDownList>
            <asp:SqlDataSource ID="DoctorsListSource" runat="server" ConnectionString="<%$ ConnectionStrings:HMSConnectionString %>" SelectCommand="SELECT [Id], [name] FROM [Users] WHERE ([type] = @type)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="doctor" Name="type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="bookAppointment" runat="server" Text="Book Appointment" OnClick="bookAppointment_Click" />
            <br />
            <label id="errorMessage" runat="server"></label>
        </div>
    </form>
</body>
</html>
