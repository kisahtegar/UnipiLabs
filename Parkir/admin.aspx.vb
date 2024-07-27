Imports System
Imports System.Data
Imports System.Data.OleDb

Partial Public Class admin
    Inherits System.Web.UI.Page
    Private strCon As String
    Private strSQL As String
    Private objAdapter As OleDbDataAdapter
    Private objCommand As OleDbCommand
    Private objDataset As DataSet
    Private myCon As OleDbConnection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            strCon = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=C:\Dev\Projects\UnipiLabs\Parkir\db_parkir.mdb;"

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

            strSQL = "INSERT INTO TB_ADMIN ([Username], [Password], FullName) VALUES ('" & txtUsername.Text & "', '" & txtPassword.Text & "', '" & txtFullName.Text & "')"
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

            strSQL = "UPDATE TB_ADMIN SET [Password] = '" & txtPassword.Text & "', FullName = '" & txtFullName.Text & "' WHERE [Username] = '" & txtUsername.Text & "'"
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

            strSQL = "DELETE FROM TB_ADMIN WHERE [Username] = '" & txtUsername.Text & "'"
            objCommand = New OleDbCommand(strSQL, myCon)
            objCommand.ExecuteNonQuery()
            MsgBox("Data Sudah Disimpan!")
            Call ListGrid()

            myCon.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Call ClearObject()
    End Sub

    Private Sub grdList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdList.SelectedIndexChanged
        Try
            txtUsername.Text = grdList.SelectedRow.Cells(1).Text
            txtFullName.Text = grdList.SelectedRow.Cells(2).Text
            txtPassword.Text = grdList.SelectedRow.Cells(3).Text
            txtUsername.Enabled = False
            btnSave.Enabled = False
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub ListGrid()
        Try
            objDataset = New DataSet
            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "SELECT * FROM TB_ADMIN ORDER BY username ASC"
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
        txtUsername.Text = ""
        txtFullName.Text = ""
        txtPassword.Text = ""
        txtUsername.Enabled = True
        btnSave.Enabled = True
    End Sub

End Class