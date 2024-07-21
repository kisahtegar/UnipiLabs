<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="LATIHAN5._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style=" width:690px; height:282px; margin:auto; background:gray; padding-top:10px; ">
        <div style=" width:660px; height:35px; margin:auto; background:white; padding-left:10px; padding-top:10px; ">
            <table style="margin:auto;">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="LATIHAN" Font-Bold="true" Font-Size="X-Large" ></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        
        <div style=" width:660px; height:203px; background:white; padding-left:10px; padding-top:10px; margin-top:10px; margin-left: auto; margin-right: auto; margin-bottom: auto;">
            <table>
                <tr>
                    <td>NIK</td> 
                    <td colspan="4">
                        <asp:TextBox ID="txtNik" runat="server"></asp:TextBox> 
                    </td>
                </tr>
                 
                <tr>
                    <td>Nama Karyawan</td>
                    <td colspan="4">
                        <asp:TextBox ID="txtNama" runat="server" Width="525px"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>Bagian</td>
                    <td colspan="4">
                        <asp:TextBox ID="txtBagian" runat="server" Width="525px"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>Status Karyawan</td>
                    <td>
                        <asp:RadioButtonList ID="optStatus" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" >
                            <asp:ListItem Text ="Kontrak" Value="K"></asp:ListItem>
                            <asp:ListItem Text ="Tetap" Value="T"></asp:ListItem> 
                        </asp:RadioButtonList>
                    </td>
                    
                    <td style="width:100px;" ></td>
                    
                    <td>Gaji Pokok</td>
                    <td>
                        <asp:TextBox ID="txtGajiPokok" runat="server" ReadOnly="true" style="text-align:right;"></asp:TextBox>
                    </td>
                </tr>
                                 <tr>
                    <td>Tunjangan</td>
                    <td>
                        <asp:TextBox ID="txtTunjangan" runat="server" style="text-align:right;"></asp:TextBox>
                    </td>
                    
                    <td style="width:100px;" ></td>
                    
                    <td>Pajak Pph 21</td>
                    <td>
                        <asp:TextBox ID="txtPph" runat="server" ReadOnly="true" style="text-align:right;"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>Gaji Bersih</td>
                    <td>
                        <asp:TextBox ID="txtGajiBersih" runat="server" ReadOnly="true" style="text-align:right;"></asp:TextBox>
                    </td>
                
                    <td style="width:100px;" ></td>
                 
                    <td colspan="2" style="text-align:right;" >
                        <asp:Button ID="btnHitung" runat="server" Text="Hitung" Width="85px" />
                        <asp:Button ID="btnBatal" runat="server" Text="Batal" Width="80px" />
                    </td>
                 </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
