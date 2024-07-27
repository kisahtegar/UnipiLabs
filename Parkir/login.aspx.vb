Imports System
Imports System.Data
Imports System.Data.OleDb

Partial Public Class login
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
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        myCon = New OleDbConnection(strCon)
        myCon.Open()

        ' SQL query to check if the username and password exist
        strSQL = "SELECT COUNT(*) FROM TB_ADMIN WHERE [Username] = ? AND [Password] = ?"
        objCommand = New OleDbCommand(strSQL, myCon)
        objCommand.Parameters.AddWithValue("Username", txtUsername.Text)
        objCommand.Parameters.AddWithValue("Password", txtPassword.Text)

        Dim result As Integer = Convert.ToInt32(objCommand.ExecuteScalar())
        If result > 0 Then
            Response.Redirect("dashboard.aspx")
        Else
            MsgBox("Invalid username or password.")
        End If

        myCon.Close()
    End Sub
End Class