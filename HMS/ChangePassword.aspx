<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="HMS.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
    <link rel="stylesheet" href="css/main.css" />
</head>
<body>
    <div class="header">
        <h1>Hospital Management System</h1>
        <h3>Hello, <%=Request.Cookies["loggedUser"]["name"] %></h3>
    </div>
    <div class="menu">
        <ul>
            <%
                if(Session["type"].ToString().Equals("doctor"))
                {
                    %>
                        
                        <li><a href="Doctor.aspx">Pending Appointments</a></li>
                        <li><a href="AttendedAppointments.aspx">Attended Appointments</a></li>
                
                    <%
                }
                else if(Session["type"].ToString().Equals("patient"))
                {
                    %>
                        
                        <li><a href="Patient.aspx">Book Appointment</a></li>
                        <li><a href="PatientUnvisitedAppointmentsList.aspx">UnAttended Appointments</a></li>
                        <li><a href="PatientVisitedAppointments.aspx">Attended Appointments</a></li>
                
                    <%
                }
                else if(Session["type"].ToString().Equals("medical"))
                {
                    %>
                        <li><a href="UnbilledAppointments.aspx">Unbilled Appointments</a></li>
                    <%
                }
                else if(Session["type"].ToString().Equals("admin"))
                {
                    %>
                        <li><a href="AddDoctor.aspx">Add Doctor</a></li>
                        <li><a href="AddMedicalRepresentative.aspx">Add Medical Representative</a></li>
                        <li><a href="ViewDoctors.aspx">Doctors</a></li>
                        <li><a href="ViewMedicalRepresentatives.aspx">Medical Representatives</a></li>
                        <li><a href="AdminViewAttendedAppointments.aspx">Attended Appointments</a></li>
                        <li><a href="AdminViewUnattendedAppointments.aspx">UnAttended Appointments</a></li>
                    <%
                }
            %>
            
            <li><a href="ChangePassword.aspx">Change Password</a></li>
            <li><a href="Logout.aspx">Logout</a></li>
        </ul>
    </div>
    <div class="clear"></div>
    <h3 class="formHeading">Change Password</h3>
    <form id="form1" runat="server">
    <div class="userForm">
        <label>Current Password</label>
        <asp:TextBox ID="currentPassword" TextMode="Password" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="passwordLengthValidator" runat="server" ErrorMessage="Password length should be between 6 - 10"
            ControlToValidate="currentPassword" ValidationExpression = "^[\s\S]{6,10}$" Display="Dynamic" ForeColor="Red"
            ></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="passwordReqValidator" runat="server" ErrorMessage="Enter Password" ForeColor="Red"
            ControlToValidate="currentPassword" Display="Dynamic" 
            ></asp:RequiredFieldValidator>
        <br />
        <label>New Password</label>
        <asp:TextBox ID="newPassword" TextMode="Password" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="newPasswordLengthValidator" runat="server" ErrorMessage="Password length should be between 6 - 10" ForeColor="Red"
            ControlToValidate="newPassword" ValidationExpression = "^[\s\S]{6,10}$" Display="Dynamic"
            ></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="newPasswordReqValidator" runat="server" ErrorMessage="Enter Password" ForeColor="Red"
            ControlToValidate="newPassword" Display="Dynamic" 
            ></asp:RequiredFieldValidator>
        <br />
        <label>Confirm Password</label>
        <asp:TextBox ID="confirmPassword" TextMode="Password" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="passwordCompareValidator" runat="server" ErrorMessage="Both passwords must match" ForeColor="Red"
            ControlToValidate="confirmPassword" ControlToCompare="newPassword" Display="Dynamic"></asp:CompareValidator>
        <asp:RequiredFieldValidator ID="confirmPasswordReqValidator" runat="server" ErrorMessage="Enter Confirm Password" ForeColor="Red"
            ControlToValidate="confirmPassword" Display="Dynamic" 
            ></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="changePassword" runat="server" Text="Change Password" OnClick="changePassword_Click" />
        <br />
        <span id="errorMessage" runat="server"></span>
        <span id="successMessage" runat="server"></span>
    </div>
    </form>
</body>
</html>
