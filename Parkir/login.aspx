<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="Parkir.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Login Page</title>
    <link href="css/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" id="container">
            <div class="form-container sign-in">
                <h1>Sign In</h1>
                <span>Username</span>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="input" ToolTip="Username" />
                <span>Password</span>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="input" TextMode="Password" ToolTip="Password" />
                <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn" BackColor="#512da8"/>
            </div>
        </div>
    </form>
</body>
</html>
