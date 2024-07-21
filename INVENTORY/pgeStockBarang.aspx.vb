Imports System
Imports System.Data
Imports System.Data.OleDb

Partial Public Class pgeStockBarang
    Inherits System.Web.UI.Page

    Private strSQL As String
    Private objDataTable As DataTable
    Private objReader As OleDbDataReader
    Private objAdapter As OleDbDataAdapter
    Private objDataset As DataSet
    Private myCon As OleDbConnection
    Private objCommand As OleDbCommand
    Private strCon As String
    Private strKodeBarang As String
    Private arrBarang(3) As String
    Private dblQtyIn As Double
    Private dblQtyAkhir As Double
    Private dblQtyOut As Double
    Private tmpNewIn As Double
    Private tmpNewAkhir As Double
    Private tmpQty As Double

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            strCon = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=C:\Dev\Projects\Kampus\kisahtegar_vb\INVENTORY\INVENTORY.mdb;"

            If Not IsPostBack Then
                Call ListGrid()
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub ListGrid()
        Try
            objDataset = New DataSet
            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "SELECT B.QTY_IN, B.QTY_OUT, B.QTY_AKHIR, B.KD_BRG, A.NM_BRG, A.SPEC_BRG, A.SAT_BRG, A.HRG_SAT FROM TBL_BARANG A, TBL_STOCK B WHERE A.KD_BRG = B.KD_BRG ORDER BY B.KD_BRG ASC"
            objAdapter = New OleDbDataAdapter(strSQL, myCon)
            objAdapter.Fill(objDataset)
            grdList.DataSource = objDataset
            grdList.DataBind()

            myCon.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class