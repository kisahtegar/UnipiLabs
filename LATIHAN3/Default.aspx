<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="LATIHAN3._Default" %>

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
    <form id="form1" runat="server">
    <div style="width:270px; height:170px; background:yellow; margin:auto;">
            <table>
                <tr>
                    <td colspan="2"><center><u>FORM INPUT DATA</u></center></td>
                </tr>
                 <tr>
                    <td colspan="2">&nbsp</td>
                </tr>
                <tr>
                    <tr>
                        <td>NIM</td>
                        <td>
                            <asp:TextBox ID="txtNIM" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                        <td>NAMA</td>
                        <td>
                            <asp:TextBox ID="txtNAMA" runat="server"></asp:TextBox>
                        </td>
                    <tr>
                        <td>JURUSAN</td>
                        <td>
                            <asp:TextBox ID="txtJURUSAN" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </tr>
            </table>
        </center>
    </div>
    </form>
</body>
</html>
