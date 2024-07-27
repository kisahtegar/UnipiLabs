<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="admin.aspx.vb" Inherits="Parkir.admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Admin Page</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- BAGIAN JUDUL -->
            <div class="header">
                Parkir Admin
            </div>
            
            <!-- BAGIAN SAMPING -->
            <div class="sidebar">
                <div class="menu-item">
                    <a href="dashboard.aspx">
                        <img src="images/dashboard.png" alt="Dashboard Icon" />
                        <span>Dashboard</span>
                    </a>
                </div>
                <div class="menu-item">
                    <img src="images/admin.png" alt="Admin Icon" />
                    <span>Admin</span>
                </div>
                <div class="menu-item">
                    <a href="parking.aspx">
                        <img src="images/parking.png" alt="Parking Icon" />
                        <span>Parking</span>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="payment.aspx">
                        <img src="images/money.png" alt="Pembayaran Icon" />
                        <span>Payment</span>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="report.aspx">
                        <img src="images/file.png" alt="Reports Icon" />
                        <span>Report</span>
                    </a>
                </div>
            </div>
            
            <!-- BAGIAN CONTENT -->
            <div class="content" >
                <!-- BAGIAN TABLE -->
                <table align="center">
                    <tr>
                        <td style="width:180px;">Username</td>
                        <td>
                            <asp:TextBox ID="txtUsername" runat="server" Width="300px" MaxLength="10" />
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="width:180px;">Full Name</td>
                        <td>
                            <asp:TextBox ID="txtFullName" runat="server" Width="300px" />
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="width:180px;">Password</td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server" Width="300px" />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnSave" Width="80px" runat="server" Text="Save" />
                            <asp:Button ID="btnUpdate" Width="80px" runat="server" Text="Update" />
                            <asp:Button ID="btnDelete" Width="80px" runat="server" Text="Delete" />
                            <asp:Button ID="btnClear" Width="80px" runat="server" Text="Clear" />
                        </td>
                    </tr>
                </table>
                <br />
                
                <!-- BAGIAN OUTPUT -->
                <div style =" width:520px; height:198px; background:white; margin:auto; overflow:auto ;  ">
                    <asp:GridView ID ="grdList" runat ="server" AutoGenerateColumns ="false" ShowFooter ="false" Width ="600px" >
                        <Columns>
                            <asp:CommandField ControlStyle-ForeColor="Blue" HeaderText ="Select" ShowHeader="true" ShowSelectButton ="true" >
                                <ControlStyle ForeColor ="Blue" />
                            </asp:CommandField>
                            <asp:BoundField DataField ="Username" HeaderText ="Username" ItemStyle-Width ="40px" >
                                <HeaderStyle Wrap ="false" />
                                <ItemStyle Wrap ="false" />
                            </asp:BoundField >
                            <asp:BoundField DataField ="FullName" HeaderText ="Nama" ItemStyle-Width ="250px" >
                                <HeaderStyle Wrap ="false" />
                                <ItemStyle Wrap ="false" />
                            </asp:BoundField >
                            <asp:BoundField DataField ="Password" HeaderText ="Password" ItemStyle-Width ="100px" >
                                <HeaderStyle Wrap ="false" />
                                <ItemStyle Wrap ="false" />
                            </asp:BoundField >
                        </Columns>
                    </asp:GridView> 
                </div>
                
            </div>
    </form>
</body>
</html>
