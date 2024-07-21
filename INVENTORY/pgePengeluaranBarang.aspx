<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="pgePengeluaranBarang.aspx.vb" Inherits="INVENTORY.pgePengeluaranBarang" %>
<%@ Register Assembly="SlimeeLibrary" Namespace="SlimeeLibrary" TagPrefix="cc1" %>
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
                                <td  align="center" valign="middle">OLAH DATA PENGELUARAN BARANG</td>
                            </tr>
                        </table>
                    </div>
                    <div style =" width:525px; height:145px; background:silver; margin:auto; padding-right :10px; padding-left:0px;  padding-top:5px; padding-bottom:5px; margin-top:5px; ">
                        <table>
                            <tr>
                                <td  style="width:180px;">NO. BUKTI</td>
                                <td>
                                    <asp:TextBox ID="txtNomor" runat="server" Width="100px" MaxLength="10" ></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:180px;">TANGGAL TRANSAKSI</td>
                                <td>
                                    <cc1:DatePicker ID="dtTglTrans" runat="server" Width="80px" PaneWidth="150px" EnableViewState="true">
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
                                <td style="width:180px;">KODE BARANG</td>
                                <td>
                                    <asp:DropDownList ID="ddlBarang" runat="server" Width="330px"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:180px;">QUANTITY BARANG</td>
                                <td>
                                    <asp:TextBox ID="txtQty" runat="server" Width="100px" ></asp:TextBox>
                                </td>
                            </tr>                    
                            <tr>
                                <td style="width:180px;">TOTAL HARGA</td>
                                <td>
                                    <asp:TextBox ID="txtHarga" runat="server" Width="200px"  ReadOnly="true"   ></asp:TextBox>
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
                    </div>
                    <div style =" width:525px; height:200px; background:silver; margin:auto; padding-right :10px; padding-left:0px;  padding-top:5px; padding-bottom:5px; margin-top:5px; overflow:auto ;  ">
                        <div style =" width:520px; height:198px; background:white; margin:auto; overflow:auto ;  ">
                            <asp:GridView ID ="grdList" runat ="server" AutoGenerateColumns ="false"
                                ShowFooter ="false" Width ="600px" >
                                <Columns >
                                    <asp:CommandField ControlStyle-ForeColor="Blue" HeaderText ="Select" ShowHeader="true" ShowSelectButton ="true" >
                                        <ControlStyle ForeColor ="Blue" />
                                    </asp:CommandField>
                                    <asp:BoundField DataField ="NO_PENGELUARAN" HeaderText ="NOMOR" ItemStyle-Width ="40px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="TGL_PENGELUARAN" HeaderText ="TANGGAL" ItemStyle-Width ="150px" DataFormatString ="{0:dd MMM yyyy}" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="KD_BRG" HeaderText ="KODE BARANG" ItemStyle-Width ="200px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="NM_BRG" HeaderText ="NAMA BARANG" ItemStyle-Width ="100px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="HRG_SAT" HeaderText ="HARGA SATUAN" ItemStyle-Width ="80px" ItemStyle-HorizontalAlign="Right" DataFormatString ="{0:N0}">
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                 <asp:BoundField DataField ="QTY" HeaderText ="QUANTITY" ItemStyle-Width ="80px" ItemStyle-HorizontalAlign="Right" DataFormatString ="{0:N0}">
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                 <asp:BoundField DataField ="TOT_HRG" HeaderText ="TOTAK HARGA" ItemStyle-Width ="80px" ItemStyle-HorizontalAlign="Right" DataFormatString ="{0:N2}">
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
