<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDoctors.aspx.cs" Inherits="HMS.ViewDoctors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Doctors</title>
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
        <h3 class="reportHeading">List of Doctors</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="DoctorsListSource" CssClass="reportTable">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="salary" HeaderText="Salary" SortExpression="salary" />
                <asp:BoundField DataField="expertise_area" HeaderText="Expertise Area" SortExpression="expertise_area" />
                <asp:BoundField DataField="consultation_fee" HeaderText="Consultation Fee" SortExpression="consultation_fee" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DoctorsListSource" runat="server" ConnectionString="<%$ ConnectionStrings:HMSConnectionString %>" SelectCommand="SELECT [Id], [name], [email], [salary], [expertise_area], [consultation_fee] FROM [Users] WHERE ([type] = @type)">
            <SelectParameters>
                <asp:Parameter DefaultValue="doctor" Name="type" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        
    </div>
    </form>
</body>
</html>
