<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="report.aspx.vb" Inherits="Parkir.report" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Report Page</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- BAGIAN JUDUL -->
            <div class="header">
                Parkir Report
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
                    <a href="admin.aspx">
                        <img src="images/admin.png" alt="Admin Icon" />
                        <span>Admin</span>
                    </a>
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
                    <img src="images/file.png" alt="Reports Icon" />
                    <span>Report</span>
                </div>
            </div>
            
            <!-- BAGIAN CONTENT -->
            <div class="content" >
                <!-- Tulis kodenya disini -->
            </div>
        </div>
    </form>
</body>
</html>
