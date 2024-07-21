<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="pgeStockBarang.aspx.vb" Inherits="INVENTORY.pgeStockBarang" %>

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
                                <td  align="center" valign="middle">LIST STOCK BARANG</td>
                            </tr>
                        </table>
                    </div>
                    <div style =" width:525px; height:360px; background:silver; margin:auto; padding-right :10px; padding-left:0px;  padding-top:5px; padding-bottom:5px; margin-top:5px; overflow:auto ;  ">
                         <div style =" width:520px; height:358px; background:white; margin:auto; overflow:auto ;  ">
                       <asp:GridView ID ="grdList" runat ="server" AutoGenerateColumns ="false"
                            ShowFooter ="false" Width ="600px" >
                            <Columns >
                                <asp:BoundField DataField ="KD_BRG" HeaderText ="KODE BARANG" ItemStyle-Width ="200px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="NM_BRG" HeaderText ="NAMA BARANG" ItemStyle-Width ="100px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="SAT_BRG" HeaderText ="SATUAN" ItemStyle-Width ="80px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="SPEC_BRG" HeaderText ="SPESIFIKASI" ItemStyle-Width ="80px" >
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                <asp:BoundField DataField ="HRG_SAT" HeaderText ="HARGA SATUAN" ItemStyle-Width ="80px" ItemStyle-HorizontalAlign="Right" DataFormatString ="{0:N2}">
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                 <asp:BoundField DataField ="QTY_IN" HeaderText ="QTY IN" ItemStyle-Width ="80px" ItemStyle-HorizontalAlign="Right" DataFormatString ="{0:N0}">
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                 <asp:BoundField DataField ="QTY_OUT" HeaderText ="QTY OUT" ItemStyle-Width ="80px" ItemStyle-HorizontalAlign="Right" DataFormatString ="{0:N0}">
                                    <HeaderStyle Wrap ="false" />
                                    <ItemStyle Wrap ="false" />
                                </asp:BoundField >
                                 <asp:BoundField DataField ="QTY_AKHIR" HeaderText ="QTY_AKHIR" ItemStyle-Width ="80px" ItemStyle-HorizontalAlign="Right" DataFormatString ="{0:N0}">
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
                    <span class="style2">Copyrights by STMIK INSAN PEMBANGUNAN - TANGERANG</span><br class="style2" />
                    <span class="style2"><span class="style2">&copy; 2021 All Rights Reserved</span></span><span class="style2"> </span>
                </div>
            </div>
        </div> 

    </form>
</body>
</html>
