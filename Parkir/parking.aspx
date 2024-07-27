<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="parking.aspx.vb" Inherits="Parkir.parking" %>
<%@ Register Assembly="SlimeeLibrary" Namespace="SlimeeLibrary" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Parking Page</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function updateTime() {
            var currentTime = new Date();
            var hours = currentTime.getHours();
            var minutes = currentTime.getMinutes();
            var seconds = currentTime.getSeconds();

            // Pad single digits with a leading zero
            hours = (hours < 10 ? "0" : "") + hours;
            minutes = (minutes < 10 ? "0" : "") + minutes;
            seconds = (seconds < 10 ? "0" : "") + seconds;

            var timeString = hours + ":" + minutes + ":" + seconds;
            document.getElementById('<%= txtJamMasuk.ClientID %>').value = timeString;
        }

        // Update the time every second
        setInterval(updateTime, 1000);
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- BAGIAN JUDUL -->
            <div class="header">
                Parkir Menu
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
                    <img src="images/parking.png" alt="Parking Icon" />
                    <span>Parking</span>
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
                <table align="center">
                    <tr>
                        <td style="width:180px;">No Kendaraan</td>
                        <td>
                            <asp:TextBox ID="txtNoKendaraan" runat="server" Width="330px" />
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="width:180px;">Jenis Kendaraan</td>
                        <td>
                            <asp:DropDownList ID="dropJenisKendaraan" runat="server">
                            <asp:ListItem Value="Motor">Motor</asp:ListItem>
                            <asp:ListItem Value="Mobil">Mobil</asp:ListItem>
                            </asp:DropDownList> 
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="width:180px;">Jam Masuk</td>
                        <td>
                            
                            <asp:TextBox ID="txtJamMasuk" runat="server" ReadOnly="true" Width="100px" MaxLength="10" />
                        </td>
                    </tr>
                    
                   <tr>
                        <td style="width:180px;">Tanggal Masuk</td>
                        <td>
                            <cc1:DatePicker ID="dtTanggalMasuk" runat="server" Width="80px" PaneWidth="150px" EnableViewState="true">
                                <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
                                <PaneHeaderStyle BackColor="#0099FF" />
                                <TitleStyle ForeColor="White" Font-Bold="true" />
                                <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
                                <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
                                <DayHeaderStyle BackColor="#E8E8E8" />
                                <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99"/>
                                <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false"/>
                                <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false"/>
                            </cc1:DatePicker>
                        </td>
                    </tr>                                       
                        
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnSimpan" Width="165px" runat="server" Text="Simpan" />
                            <asp:Button ID="btnClear" Width="165px" runat="server" Text="Clear" />
                        </td>
                    </tr> 
                </table>

                <div style =" width:702px; height:230px; background:silver; padding-right :10px; padding-left:0px;  padding-top:5px; padding-bottom:5px; margin-top:5px; margin-left: auto; margin-right: auto; margin-bottom: auto;">
                    <div style =" width:702px; height:230px; background:white; margin:auto; overflow:auto ;  ">
                        <asp:GridView ID ="grdList" runat ="server" AutoGenerateColumns ="false"
                            ShowFooter ="false" Width ="200px" Height="224px" >
                            <Columns >
                                <asp:CommandField ControlStyle-ForeColor="Blue" HeaderText ="Select" ShowHeader="true" ShowSelectButton ="true" >
                                    <ControlStyle ForeColor ="Blue" />
                                </asp:CommandField>
                                <asp:BoundField DataField ="NoKarcis" HeaderText ="No Karcis" ItemStyle-Width ="30px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="NoKendaraan" HeaderText ="No Kendaraan" ItemStyle-Width ="200px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="JenisKendaraan" HeaderText ="Jenis Kendaraan" ItemStyle-Width ="30px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="TanggalMasuk" HeaderText ="Tanggal Masuk" ItemStyle-Width ="200px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="JamMasuk" HeaderText ="Jam Masuk" ItemStyle-Width ="200px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
