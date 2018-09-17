<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMedicalRepresentative.aspx.cs" Inherits="HMS.AddMedicalRepresentative" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Medical Representative</title>
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
    <h3 class="formHeading">Add Medical Representative</h3>
    <form id="form1" runat="server">
        <div class="userForm">
            <label>Name</label>
            <asp:TextBox ID="userName" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="nameValidator" runat="server" ErrorMessage="Inavlid Name" ForeColor="Red"
                ControlToValidate="userName" Display="Dynamic" ValidationExpression="^[a-zA-Z'.\s]{1,50}"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="nameReqValidator" runat="server" ErrorMessage="Enter Name" ForeColor="Red"
                ControlToValidate="userName" Display="Dynamic"></asp:RequiredFieldValidator>
            <br />
            <label>Email</label>
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="emailValidator" runat="server" ErrorMessage="Invalid Email" ForeColor="Red"
                ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="email" Display="Dynamic"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="emailReqValidator" runat="server" ErrorMessage="Enter Email" ForeColor="Red"
                ControlToValidate="email" Display="Dynamic"></asp:RequiredFieldValidator>
            <br />
            <label>Password</label>
            <asp:TextBox ID="password" TextMode="Password" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="passwordLengthValidator" runat="server" ErrorMessage="Password length should be between 6 - 10" ForeColor="Red"
                ControlToValidate="password" ValidationExpression="^[\s\S]{6,10}$" Display="Dynamic"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="passwordReqValidator" runat="server" ErrorMessage="Enter Password"
                ControlToValidate="password" Display="Dynamic"></asp:RequiredFieldValidator>
            <br />
            <label>Salary</label>
            <asp:TextBox ID="salary" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="salaryReqValidator" runat="server" ErrorMessage="Enter Salary" ForeColor="Red"
                ControlToValidate="salary" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidatorSalaryType" runat="server" ControlToValidate="salary" Type="Double" ForeColor="Red"
                Operator="DataTypeCheck" ErrorMessage="Invalid Salary" Display="Dynamic"></asp:CompareValidator>
            <asp:CompareValidator ID="CompareValidatorSalaryValue" runat="server" ControlToValidate="salary" Type="Double" ForeColor="Red"
                Operator="GreaterThan" ErrorMessage="Salary must be greater than 0" ValueToCompare="0" Display="Dynamic"></asp:CompareValidator>
            <br />
            <asp:Button ID="addMedicalRepresentative" runat="server" Text="Add Medical Representative" OnClick="addMedicalRepresentative_Click" />
            <br />
            <span runat="server" id="errorMessage"></span>
            <span runat="server" id="successMessage"></span>
        </div>
    </form>
</body>
</html>