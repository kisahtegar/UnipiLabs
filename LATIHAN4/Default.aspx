<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="LATIHAN4._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Yudha Page</title>
    <style type=text/css">
        .KOTAK_UTAMA
        {
        	width:300px;
        	height:170px;
        	background:yellow;
        	margin:auto;
        	
        }
        .KOTAK_LUAR
        {
        	
        }
        
    </style>
    
    <style type="text/jsscript">
        function OnlyNumbericEntry()
        { 
            if {(event.keycode < 48 || event.keykode > 57)}
            event.returnvalue = false;
        }
        	
    </style> 
 
</head>
<body>
    <form id="form2" runat="server">
    <div style="width:290px; height:200px; background:yellow; margin:auto;">
            <table>
                <tr>
                    <td colspan="2"><center><u>PERHITUNGAN</u></center></td>
                </tr>
                 <tr>
                    <td colspan="2">&nbsp</td>
                </tr>
                <tr>
                    <tr>
                        <td>NIK</td>
                        <td>
                            <asp:TextBox ID="txtNIK" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                        <td>GAJI POKOK</td>
                        <td>
                            <asp:TextBox ID="txtGAPOK" runat="server"></asp:TextBox>
                        </td>
                    <tr>
                        <td>TUNJANGAN</td>
                        <td>
                            <asp:TextBox ID="txtTUNJANGAN" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>POTONGAN</td>
                        <td>
                            <asp:TextBox ID="txtPOTONGAN" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>GAJI BERSIH</td>
                        <td>
                            <asp:TextBox ID="txtGABER" runat="server" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                    <td colspan="2" align="center"><asp:Button ID="btnHITUNG" runat="server" Text="HITUNG" /></td>
                    </tr>
                   
                    
                </tr>
            </table>
        </center>
    </div>
    </form>
</body>
</html>
