Imports System
Imports System.Data
Imports System.Data.OleDb

Partial Public Class pgeMasterBarang
    Inherits System.Web.UI.Page
    Private strSQL As String
    Private objDataTable As DataTable
    Private objReader As OleDbDataReader
    Private objAdapter As OleDbDataAdapter
    Private objDataset As DataSet
    Private myCon As OleDbConnection
    Private objCommand As OleDbCommand
    Private strCon As String

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

    Private Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Try
            myCon = New OleDbConnection(strCon)
            myCon.Open()
            strSQL = "INSERT INTO TBL_BARANG(KD_BRG, NM_BRG) VALUES('" & txtKodeBarang.Text & "', '" & txtNamaBarang.Text & "')"
            objCommand = New OleDbCommand(strSQL, myCon)
            objCommand.ExecuteNonQuery()
            MsgBox("Data Sudah Disimpan!")
            Call ListGrid()
            myCon.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        Try
            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "DELETE FROM TBL_BARANG WHERE KD_BRG = '" & txtKodeBarang.Text & "'"

            objCommand = New OleDbCommand(strSQL, myCon)
            objCommand.ExecuteNonQuery()
            MsgBox("Data Sudah Disimpan!")

            Call ListGrid()
            myCon.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Try
            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "UPDATE TBL_BARANG SET NM_BRG = '" & txtNamaBarang.Text & "', SAT_BRG = '" & txtSatuanBarang.Text & "', SPEC_BRG = '" & txtSpecBarang.Text & "', HRG_SAT = '" & CDbl(txtHargaSatuan.Text) & "' WHERE KD_BRG = '" & txtKodeBarang.Text & "'"

            objCommand = New OleDbCommand(strSQL, myCon)
            objCommand.ExecuteNonQuery()
            MsgBox("Data Sudah Disimpan!")

            Call ListGrid()
            myCon.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub ListGrid()
        Try
            objDataset = New DataSet
            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "SELECT * FROM TBL_BARANG ORDER BY KD_BRG ASC"
            objAdapter = New OleDbDataAdapter(strSQL, myCon)
            objAdapter.Fill(objDataset)
            grdList.DataSource = objDataset
            grdList.DataBind()

            myCon.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub ClearObject()
        txtKodeBarang.Text = ""
        txtNamaBarang.Text = ""
        txtSpecBarang.Text = ""
        txtSatuanBarang.Text = ""
        txtHargaSatuan.Text = ""
    End Sub

    Private Sub grdList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdList.SelectedIndexChanged
        Try
            txtKodeBarang.Text = grdList.SelectedRow.Cells(1).Text
            txtNamaBarang.Text = grdList.SelectedRow.Cells(2).Text
            txtSatuanBarang.Text = grdList.SelectedRow.Cells(3).Text
            txtSpecBarang.Text = grdList.SelectedRow.Cells(4).Text
            txtHargaSatuan.Text = Format(CDbl(grdList.SelectedRow.Cells(5).Text), "#,##0.00")
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Call ClearObject()
    End Sub

    Private Sub ShowMessageBox(ByVal strMessage As String)
        Dim strScript As String = "<script language=JavaScript>"
        strScript += "alert(""" & strMessage & """);"
        strScript += "</script>"
        If (Not ClientScript.IsStartupScriptRegistered("MyMessage")) Then
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyMessage", strScript)
        End If
    End Sub

End Class