<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HMS.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
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
    <form id="form1" runat="server">
		<asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" DisplayRememberMe="false">
		</asp:Login>
		<br />
		<label runat="server" id="errorMessage" style="display:none;"></label>
    </form>
</body>
</html>