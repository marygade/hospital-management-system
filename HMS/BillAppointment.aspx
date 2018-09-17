<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BillAppointment.aspx.cs" Inherits="HMS.BillAppointment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bill Appointment</title>
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
    <h3 class="formHeading">Bill an Appointment</h3>
    <form id="form1" runat="server">
        <div class="userForm" style="width:30%">
            <label>Problem</label>
            <asp:TextBox ID="patientProblem" runat="server" TextMode="MultiLine" Rows="5" Columns="35" Enabled="false"></asp:TextBox>
            <br />
            <label>Patient Name</label>
            <span runat="server" id="patientName"></span>
            <br />
            <label>Doctor Name</label>
            <span runat="server" id="doctorName"></span>
            <br />
            <label>Consultation Fee</label>
            <asp:TextBox runat="server" ID="consultationFee" Enabled="false"></asp:TextBox>
            <br />
            <label>Note</label>
            <asp:TextBox ID="doctorNote" runat="server" TextMode="MultiLine" Rows="5" Columns="35" Enabled="false"></asp:TextBox>
            <br />
            <label>Medicine</label>
            <asp:TextBox ID="medicine" runat="server" TextMode="MultiLine" Rows="5" Columns="35" Enabled="false"></asp:TextBox>
            <br />
            <label>Medicine Bill</label>
            <asp:TextBox ID="medicineBill" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="medicineBillValidator" runat="server" ErrorMessage="Enter Bill" ForeColor="Red"
                ControlToValidate="medicineBill" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="medicineBillCMPValidator" runat="server" ControlToValidate="medicineBill" Type="Double" ForeColor="Red"
                Operator="DataTypeCheck" ErrorMessage="Invalid Bill" Display="Dynamic"></asp:CompareValidator>
            <asp:CompareValidator ID="medicineBillFeeValidator2" runat="server" ControlToValidate="medicineBill" Type="Double" ForeColor="Red"
                Operator="GreaterThan" ErrorMessage="Bill should be > 0" ValueToCompare="0" Display="Dynamic"></asp:CompareValidator>
            <br />
            <label>Tests</label>
            <asp:TextBox ID="tests" runat="server" TextMode="MultiLine" Rows="5" Columns="35" Enabled="false"></asp:TextBox>
            <br />
            <label>Tests Bill</label>
            <asp:TextBox ID="testsBill" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="testBillValidator" runat="server" ErrorMessage="Enter Bill" ForeColor="Red"
                ControlToValidate="testsBill" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="testsBill" Type="Double" ForeColor="Red"
                Operator="DataTypeCheck" ErrorMessage="Invalid Bill" Display="Dynamic"></asp:CompareValidator>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="testsBill" Type="Double" ForeColor="Red"
                Operator="GreaterThan" ErrorMessage="Bill should be > 0" ValueToCompare="0" Display="Dynamic"></asp:CompareValidator>
            <br />
            <asp:Button ID="postBill" runat="server" Text="Bill Appointment" OnClick="postBill_Click" />
            <br />
            <p id="errorMessage" runat="server"></p>
        </div>
    </form>
</body>
</html>