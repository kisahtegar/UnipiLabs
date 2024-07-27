<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="payment.aspx.vb" Inherits="Parkir.payment" %>
<%@ Register Assembly="SlimeeLibrary" Namespace="SlimeeLibrary" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Payment Page</title>
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
            document.getElementById('<%= txtJamKeluar.ClientID %>').value = timeString;
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
                Parkir Payment
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
                    <img src="images/money.png" alt="Pembayaran Icon" />
                    <span>Payment</span>
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
                <!-- Tulis kodenya disini -->
                <table align="center">
                    <tr>
                        <td style="width:180px;">No Karcis</td>
                        <td>
                            <asp:TextBox ID="txtNoKarcis" runat="server" ReadOnly="false" Width="300px" MaxLength="10" />
                        </td>
                          <td>
                            <asp:Button ID="btncari" Width="85px" runat="server" Text="Search"/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="width:180px;">No Kendaraan</td>
                        <td>
                            <asp:TextBox ID="txtNoKendaraan" runat="server" ReadOnly="true" Width="300px" />
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="width:180px;">Jenis Kendaraan</td>
                        <td>
                            <asp:TextBox ID="txtJenisKendaraan" runat="server" ReadOnly="true" Width="300px" />
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
                        <td style="width:180px;">Jam Masuk</td>
                        <td>
                            <asp:TextBox ID="txtJamMasuk" runat="server" ReadOnly="true" Width="300px" MaxLength="10" />
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="width:180px;">Tanggal Keluar</td>
                        <td>
                            <cc1:DatePicker ID="dtTanggalKeluar" runat="server" Width="80px" PaneWidth="150px" EnableViewState="true">
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
                        <td style="width:180px;">Jam Keluar</td>
                        <td>
                            <asp:TextBox ID="txtJamKeluar" runat="server" ReadOnly="true" Width="300px" MaxLength="10" />
                        </td>
                    </tr>
                    
                    
                    <tr>
                        <td style="width:180px;">Tarif</td>
                        <td>
                            <asp:TextBox ID="txtTarif" runat="server" ReadOnly="true" Width="300px" MaxLength="10" />
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="width:180px;">Bayar</td>
                        <td>
                            <asp:TextBox ID="txtBayar" runat="server" ReadOnly="false" Width="300px" />
                        </td>
                        <td>
                            <asp:Button ID="btnKembalian" Width="85px" runat="server" Text="Calculate" />
                        </td>
                    </tr>
                    
                     <tr>
                        <td style="width:180px;">Kembalian</td>
                        <td>
                            <asp:TextBox ID="txtKembalian" runat="server" ReadOnly="true" Width="300px" />
                        </td>
                    </tr>
                    
                     <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnSave" Width="80px" runat="server" Text="Save" />                           
                            <asp:Button ID="btnDelete" Width="80px" runat="server" Text="Delete" />
                            <asp:Button ID="btnClear" Width="80px" runat="server" Text="Clear" />
                        </td>
                    </tr>
         
                </table>
                
                <div style =" width:700px; height:198px; background:white; margin:auto; overflow:auto ;  ">
                    <asp:GridView ID ="grdList" runat ="server" AutoGenerateColumns ="false" 
                         ShowFooter ="false" Width ="410px" >
                        <Columns>
                            <asp:CommandField ControlStyle-ForeColor="Blue" HeaderText ="Select" ShowHeader="true" ShowSelectButton ="true" >
                                <ControlStyle ForeColor ="Blue" />
                            </asp:CommandField>
                            <asp:BoundField DataField ="NoKarcis" HeaderText ="No Karcis" ItemStyle-Width ="5px" >
                                <HeaderStyle Wrap ="false" />
                                <ItemStyle Wrap ="false" />
                            </asp:BoundField >
                            <asp:BoundField DataField ="NoKendaraan" HeaderText ="No Kendaraan" ItemStyle-Width ="5px" >
                                <HeaderStyle Wrap ="false" />
                                <ItemStyle Wrap ="false" />
                            </asp:BoundField >
                            <asp:BoundField DataField ="JenisKendaraan" HeaderText ="Jenis Kendaraan" ItemStyle-Width ="5px" >
                                <HeaderStyle Wrap ="false" />
                                <ItemStyle Wrap ="false" />
                            </asp:BoundField >
                            <asp:BoundField DataField ="JamMasuk" HeaderText ="Jam Masuk" ItemStyle-Width ="5px" >
                                <HeaderStyle Wrap ="false" />
                                <ItemStyle Wrap ="false" />
                            </asp:BoundField >
                            <asp:BoundField DataField ="JamKeluar" HeaderText ="Jam Keluar" ItemStyle-Width ="5px" >
                                <HeaderStyle Wrap ="false" />
                                <ItemStyle Wrap ="false" />
                            </asp:BoundField >
                            <asp:BoundField DataField ="Tarif" HeaderText ="Tarif" ItemStyle-Width ="5px" >
                                <HeaderStyle Wrap ="false" />
                                <ItemStyle Wrap ="false" />
                            </asp:BoundField >
                            <asp:BoundField DataField ="Bayar" HeaderText ="Bayar" ItemStyle-Width ="5px" >
                                <HeaderStyle Wrap ="false" />
                                <ItemStyle Wrap ="false" />
                            </asp:BoundField >
                            <asp:BoundField DataField ="Kembalian" HeaderText ="Kembalian" ItemStyle-Width ="5px" >
                                <HeaderStyle Wrap ="false" />
                                <ItemStyle Wrap ="false" />
                            </asp:BoundField >
                        </Columns>
                    </asp:GridView> 
                </div>
                
            </div>
        </div>
    </form>
</body>
</html>
