<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDoctor.aspx.cs" Inherits="HMS.AddDoctor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Doctor</title>
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
    <h3 class="formHeading">Add Doctor</h3>
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
            <asp:RequiredFieldValidator ID="passwordReqValidator" runat="server" ErrorMessage="Enter Password" ForeColor="Red"
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
            <label>Expertise Area</label>
            <asp:TextBox ID="expertiseArea" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="expertiseAreaValidator" runat="server" ErrorMessage="Length should be 3 - 30" ForeColor="Red"
                ControlToValidate="expertiseArea" ValidationExpression="^[\s\S]{3,30}$" Display="Dynamic"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="expertiseAreaReqValidator" runat="server" ErrorMessage="Enter expertise" ForeColor="Red"
                ControlToValidate="expertiseArea" Display="Dynamic"></asp:RequiredFieldValidator>
            <br />
            <label>Consulatation Fee</label>
            <asp:TextBox ID="consultationFee" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="consultationFeeValidator" runat="server" ErrorMessage="Enter Fee" ForeColor="Red"
                ControlToValidate="consultationFee" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="consultationFeeCMPValidator" runat="server" ControlToValidate="consultationFee" Type="Double" ForeColor="Red"
                Operator="DataTypeCheck" ErrorMessage="Invalid Fee" Display="Dynamic"></asp:CompareValidator>
            <asp:CompareValidator ID="consultationFeeValidator2" runat="server" ControlToValidate="consultationFee" Type="Double" ForeColor="Red"
                Operator="GreaterThan" ErrorMessage="Fee should be > 0" ValueToCompare="0" Display="Dynamic"></asp:CompareValidator>
            <br />
            <asp:Button ID="addDoctor" runat="server" Text="Add Doctor" OnClick="addDoctor_Click" />
            <br />
            <span runat="server" id="errorMessage"></span>
            <span runat="server" id="successMessage"></span>
        </div>
    </form>
</body>
</html>
