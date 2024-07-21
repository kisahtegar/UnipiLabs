<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="pgeUTS.aspx.vb" Inherits="_2021804041.pgeUTS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="pgeUTS" runat="server">
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
        	width:700px; 
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
        .style5
        {
            width: 98px;
        }
        .style6
        {
            width: 84px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style=" width:788px; height:686px; margin:auto; background:gray; padding-top:10px; ">
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
        
        <div style=" width:700px; height:100px; background:white; padding-left:10px; padding-top:10px; margin-top:9px; margin-left: auto; margin-right: auto; margin-bottom: auto; ">
            <table style="margin:auto;">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="SOAL UTS" Font-Bold="true" Font-Size="X-Large" ></asp:Label>
                    </td>
                </tr>
            </table>
            <div></div>
            <table style="margin:auto;">
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="NIM : 2021804041" Font-Bold="true" Font-Size="Medium" ></asp:Label>
                    </td>
                    <td class="style3"></td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="NAMA : KISAH TEGAR PUTRA ABDI" Font-Bold="true" Font-Size="Medium" ></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        
        <div style=" width:700px; height:233px; background:white; padding-left:10px; padding-top:10px; margin-top:10px; margin-left: auto; margin-right: auto; margin-bottom: auto;">
            <table>
                <tr>
                    <td class="text-style">No Anggota</td> 
                    <td colspan="4">
                        <asp:TextBox ID="txtNoAnggota" runat="server" Width="175px"></asp:TextBox>
                    </td>
                    
                </tr>
                 
                <tr>
                    <td class="text-style">Nama Anggota</td>
                    <td colspan="4">
                        <asp:TextBox ID="txtNama" runat="server" Width="453px"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td class="text-style">Jenis Pinjaman</td>
                    <td class="style6">
                        <asp:RadioButtonList ID="rbJenisPinjaman" runat="server" RepeatDirection="Horizontal" AutoPostBack="true">
                            <asp:ListItem Text="Tunai" Value="T"></asp:ListItem>
                            <asp:ListItem Text="Barang" Value="B"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    
                    <td></td>
                    <td></td>
                    
                    <td class="style5">Besar Pinjaman</td>
                    <td>
                        <asp:TextBox ID="txtBesarPinjaman" runat="server" Width="122px"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td class="text-style">Bunga Pinjaman</td>
                    <td class="style6">
                        <asp:TextBox ID="txtBungaPinjaman" runat="server" Width="50px"></asp:TextBox>%
                    </td>
                    
                    <td class="style5">Durasi</td>
                    <td>
                        <asp:TextBox ID="txtDurasi" runat="server" Width="50px"></asp:TextBox>X
                        
                    </td>
                    
                    <td class="style5">Besar Bunga</td>
                    <td>
                        <asp:TextBox ID="txtBesarBunga" runat="server" Width="122px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="style5">Pinjaman+Bunga</td>
                    <td class="style6">
                        <asp:TextBox ID="txtPinjamanBunga" runat="server" Width="139px"></asp:TextBox>
                    </td>
                    <td></td>
                    <td></td>
                    
                    <td class="style5">Cicilan/Bulan</td>
                    <td class="style6">
                        <asp:TextBox ID="txtCicilanBulan" runat="server" Width="122px"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:Button ID="btnCalculate" runat="server" Text="Calculate" Width="85px" />
                    </td>
                    <td>
                        <asp:Button ID="btnClear" runat="server" Text="Clear" Width="85px" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
