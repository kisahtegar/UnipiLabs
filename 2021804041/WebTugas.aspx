<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebTugas.aspx.vb" Inherits="_2021804041.WebTugas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>2021804041</title>
    <style type="text/css">
        .text-style {
            width: 147px;
        }
        .text-style-right {
            width: 100px;
        }
        .style3 {
            width: 230px;
        }
        .header-unipi {
        	width:660px; 
        	height:199px; 
        	margin:auto; 
        	background:white; 
        	padding-left:10px; 
        	padding-top:10px; 
        	background-color: #34eba4;
        }
        .header-container {
            width: 627px;
            height: 123px;
            margin: auto;
            padding-left: 10px;
            padding-top: 10px;
        }
        .header-logo {
            width: 114px;
            height: 83px;
            margin-right: 10px;
        }
        .header-text {
            color: #000;
            font-family: 'Arial', sans-serif;
        }
        .header-text .welcome {
            font-weight: bold;
            font-size: 24px;
            color: #4B0082;
        }
        .header-text .campus-name {
            font-weight: bold;
            font-size: 28px;
            color: #FF4500;
            font-family: 'Brush Script MT', cursive;
        }
        .header-text .tagline {
            font-size: 14px;
            color: #000080;
            font-style: italic;
        }
        .style4
        {
            width: 69px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style=" width:688px; height:586px; margin:auto; background:gray; padding-top:10px; ">
        <!-- Header -->
        <div class="header-unipi">
             <div class="header-container">
                <img src="Asset/unipi-logo.png" alt="Logo" class="header-logo" />
                <div class="header-text">
                    <div class="welcome">Welcome To Campus</div>
                    <div class="campus-name">Insan Pembangunan</div>
                    <div class="tagline">Professional Campus for Professional Career</div>
                </div>
            </div>
        </div>
        
        <div style=" width:660px; height:40px; background:white; padding-left:10px; padding-top:10px; margin-top:9px; margin-left: auto; margin-right: auto; margin-bottom: auto; ">
            <table style="margin:auto;">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="SOAL TUGAS" Font-Bold="true" Font-Size="X-Large" ></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        
        <div style=" width:660px; height:233px; background:white; padding-left:10px; padding-top:10px; margin-top:10px; margin-left: auto; margin-right: auto; margin-bottom: auto;">
            <table>
                <tr>
                    <td class="text-style">No Pemesanan</td> 
                    <td colspan="4">
                        <asp:TextBox ID="txtNoPemesanan" runat="server" Width="175px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnCalculate" runat="server" Text="Calculate" Width="85px" />
                    </td>
                </tr>
                 
                <tr>
                    <td class="text-style">Nama Pemesanan</td>
                    <td colspan="4">
                        <asp:TextBox ID="txtNama" runat="server" Width="417px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnClear" runat="server" Text="Clear" Width="85px" />
                    </td>
                </tr>

                <tbody>
                    <tr>
                        <td class="text-style" rowspan="7">Jurusan</td>
                        <td class="text-style" rowspan="7">
                            <asp:RadioButtonList ID="rbJurusan" runat="server" RepeatDirection="Vertical" AutoPostBack="true">
                                <asp:ListItem Text="Jogjakarta" Value="J"></asp:ListItem>
                                <asp:ListItem Text="Surabaya" Value="S"></asp:ListItem>
                                <asp:ListItem Text="Malang" Value="M"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        
                        <td class="style4"></td>
                      
                        <td class="text-style-right">Keberangkatan</td>
                        <td>
                            <asp:RadioButtonList ID="rbKeberangkatan" runat="server" RepeatDirection="Horizontal" AutoPostBack="true">
                                <asp:ListItem Text="Pagi" Value="P"></asp:ListItem>
                                <asp:ListItem Text="Malam" Value="M"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="style4"></td>
                        <td>Jumlah Tiket</td> 
                        <td class="text-style-right">
                            <asp:TextBox ID="txtJumlahTiket" runat="server" Width="135px"></asp:TextBox>
                        </td> 
                    </tr>

                    <tr>
                        <td class="style4"></td>
                        <td>Harga Tiket</td> 
                        <td class="text-style-right">
                            <asp:TextBox ID="txtHargaTiket" runat="server" Width="135px" ReadOnly=true></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="style4"></td>
                        <td>Ppn</td> 
                        <td class="text-style-right">
                            <asp:TextBox ID="txtPpn" runat="server" Width="135px" ReadOnly=true></asp:TextBox>
                        </td> 
                    </tr>
                    
                    <tr>
                        <td class="style4"></td>
                        <td>Discount</td> 
                        <td class="text-style-right">
                            <asp:TextBox ID="txtDiscount" runat="server" Width="135px" ReadOnly=true></asp:TextBox>
                        </td> 
                    </tr>
                    
                    <tr>
                        <td class="style4"></td>
                        <td>Total Harga</td> 
                        <td class="text-style-right">
                            <asp:TextBox ID="txtTotalHarga" runat="server" Width="135px" ReadOnly=true></asp:TextBox>
                        </td> 
                    </tr>
                 </tbody>
            </table>
        </div>
        
        <div style=" width:660px; height:34px; background:white; padding-left:10px; padding-top:10px; margin-top:10px; margin-left: auto; margin-right: auto; margin-bottom: auto; ">
            <table style="margin:auto;">
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="NIM : 2021804041" Font-Bold="true" Font-Size="Medium" ></asp:Label>
                    </td>
                    <td class="style3"></td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="NAMA : KISAH TEGAR PUTRA ABDI" Font-Bold="true" Font-Size="Medium" ></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
