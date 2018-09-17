<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="HMS.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <link rel="stylesheet" href="css/main.css" />
</head>
<body>
    <div class="header">
        <h1>Hospital Management System</h1>
    </div>
    <div class="menu">
        <ul>
            <li><a href="index.aspx">Login</a></li>
            <li><a href="Registration.aspx">Registration</a></li>
        </ul>
    </div>
    <div class="clear"></div>
    <h3 class="formHeading">Registration</h3>
    <form id="form1" runat="server">
    <div class="userForm" style="width: 22%">
        <label>Name</label>
        <asp:TextBox ID="userName" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="nameValidator" runat="server" ErrorMessage="Inavlid Name"
            ControlToValidate="userName" Display="Dynamic" ValidationExpression="^[a-zA-Z'.\s]{1,50}"
            ForeColor="Red"
            ></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="nameReqValidator" runat="server" ErrorMessage="Enter Name"
            ControlToValidate="userName" Display="Dynamic" ForeColor="Red"
            ></asp:RequiredFieldValidator>
        <br />
        <label>Email</label>
        <asp:TextBox ID="email" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="emailValidator" runat="server" ErrorMessage="Invalid Email"
            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
            ControlToValidate="email" Display="Dynamic" ForeColor="Red"
            ></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="emailReqValidator" runat="server" ErrorMessage="Enter Email"
            ControlToValidate="email" Display="Dynamic"  ForeColor="Red"
            ></asp:RequiredFieldValidator>
        <br />
        <label>Password</label>
        <asp:TextBox ID="password" TextMode="Password" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="passwordLengthValidator" runat="server" ErrorMessage="Password length should be between 6 - 10"
            ControlToValidate="password" ValidationExpression = "^[\s\S]{6,10}$" Display="Dynamic" ForeColor="Red"
            ></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="passwordReqValidator" runat="server" ErrorMessage="Enter Password"
            ControlToValidate="password" Display="Dynamic"  ForeColor="Red"
            ></asp:RequiredFieldValidator>
        <br />
        <label>Confirm Password</label>
        <asp:TextBox ID="confirmPassword" TextMode="Password" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="passwordCompareValidator" runat="server" ErrorMessage="Both passwords must match" ForeColor="Red"
            ControlToValidate="confirmPassword" ControlToCompare="password" Display="Dynamic"></asp:CompareValidator>
        <asp:RequiredFieldValidator ID="confirmPasswordReqValidator" runat="server" ErrorMessage="Enter Confirm Password"
            ControlToValidate="confirmPassword" Display="Dynamic" ForeColor="Red"
            ></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="register" runat="server" Text="Register" OnClick="register_Click" />
        <br />
        <label runat="server" id="errorMessage"></label>
    </div>
    </form>
</body>
</html>