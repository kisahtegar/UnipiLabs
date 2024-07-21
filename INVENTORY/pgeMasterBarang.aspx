<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="pgeMasterBarang.aspx.vb" Inherits="INVENTORY.pgeMasterBarang" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
   <title>UNIVERSITAS INSAN PEMBANGUNAN INDONESIA</title>
    <link href="MyStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
        .style2
        {
            font-family: "Courier New";
            font-size: small;
            color: #FFFFFF;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
            <div style="width:800px; height:610px; margin:auto; background:#999999; padding-top:10px; border:1px;  " >
            <div style="width:780px; height:125px; margin:auto; background:white; padding-top:5px;  "  >
                <div style ="width:770px; height:110px; background:gray; margin:auto;  padding-top:0px; padding-bottom:0px;">
                    <img src="logoip.jpg" width="770" height ="120" alt =""/>
                </div>                
            </div>
            <div style ="width:780px; height:415px; margin:auto; background:#999999; margin-top:5px; padding-bottom :5px; " >
                <div style="width:230px; height:415px; float:left; background:white; "  >
                    <div style ="width:215px; height:395px; background:#333333; margin:auto; padding-left:5px; padding-top:5px; padding-bottom:5px; margin-top:5px;">
                        <div class="StyleMenu">
                            <h3 class="HeaderBar">MAIN MENU</h3>
                            <ul>
                               <li><a href="pgeMainMenu.aspx">HOME</a></li>
                                <li><a href="pgeMasterBarang.aspx">MASTER BARANG</a></li>
                                <li><a href="pgePenerimaanBarang.aspx">PENERIMAAN BARANG</a></li>
                                <li><a href="pgePengeluaranBarang.aspx">PENGELUARAN BARANG</a></li>
                                <li><a href="pgeStockBarang.aspx">STOCK BARANG</a></li>
                                <li><a href="pgeLogin.aspx">LOGOUT</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div style ="width:545px; height:415px; float:right; background:white;" >
                    <div style =" width:515px; height:20px; background:silver; margin:auto; padding-right :10px; padding-left:10px;  padding-top:5px; padding-bottom:5px; margin-top:5px;">
                        <table align="center" >
                            <tr align="center" valign="middle">
                                <td  align="center" valign="middle">OLAH DATA MASTER BARANG</td>
                            </tr>
                        </table>
                    </div>
                    <div style =" width:525px; height:150px; background:silver; margin:auto; padding-right :10px; padding-left:0px;  padding-top:5px; padding-bottom:5px; margin-top:5px; ">
                        <table>
                            <tr>
                                <td  style="width:180px;">KODE BARANG</td>
                                <td>
                                    <asp:TextBox ID="txtKodeBarang" runat="server" Width="100px" MaxLength="10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:180px;">NAMA BARANG</td>
                                <td>
                                    <asp:TextBox ID="txtNamaBarang" runat="server" Width="330px"></asp:TextBox>
                                </td>
                            </tr>                    
                            <tr>
                                <td style="width:180px;">SPESIFIKASI BARANG</td>
                                <td>
                                    <asp:TextBox ID="txtSpecBarang" runat="server" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:180px;">SATUAN BARANG</td>
                                <td>
                                    <asp:TextBox ID="txtSatuanBarang" runat="server" Width="100px"></asp:TextBox>
                                </td>
                            </tr>                    
                            <tr>
                                <td style="width:180px;">HARGA SATUAN</td>
                                <td>
                                    <asp:TextBox ID="txtHargaSatuan" runat="server" Width="100px" ></asp:TextBox>
                                </td>
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
                    </div>
                    <div style =" width:525px; height:200px; background:silver; margin:auto; padding-right :5px; padding-left:5px;  margin-top:5px; padding-top:5px; ">
                        <div style =" width:520px; height:198px; background:white; margin:auto; overflow:auto ;  ">
                            <asp:GridView ID ="grdList" runat ="server" AutoGenerateColumns ="false"
                            ShowFooter ="false" Width ="600px" >
                            <Columns >
                                <asp:CommandField ControlStyle-ForeColor="Blue" HeaderText ="Select" ShowHeader="true" ShowSelectButton ="true" >
                                    <ControlStyle ForeColor ="Blue" />
                                </asp:CommandField>
                                <asp:BoundField DataField ="KD_BRG" HeaderText ="KODE" ItemStyle-Width ="40px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="NM_BRG" HeaderText ="NAMA" ItemStyle-Width ="250px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="SAT_BRG" HeaderText ="SATUAN" ItemStyle-Width ="100px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="SPEC_BRG" HeaderText ="SPESIFIKASI" ItemStyle-Width ="100px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="HRG_SAT" HeaderText ="HARGA SATUAN" ItemStyle-Width ="80px" ItemStyle-HorizontalAlign="Right" DataFormatString ="{0:N2}">
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                            </Columns>
                        </asp:GridView>   
                        </div>
                                             
                    </div>
                </div>   
            </div>
            
            <div style="width:780px; height:40px; margin:auto; background:white; padding-top:5px;" class="style1"  >
                <div style ="width:770px; height:30px; background:#333333; margin:auto; padding-bottom:5px;" >                
                    <span class="style2">Copyrights by UNIPI - TANGERANG</span><br class="style2" />
                    <span class="style2"><span class="style2">&copy; 2023 All Rights Reserved</span></span><span class="style2"> </span>
                </div>
            </div>
        </div> 

    </form>
</body>
</html>
