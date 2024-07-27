Imports System
Imports System.Data
Imports System.Data.OleDb

Partial Public Class parking
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
                dtTanggalMasuk.SelectedDate = DateTime.Now
                txtJamMasuk.Text = DateTime.Now.ToString("HH:mm:ss")
                Call ListGrid()
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnSimpan_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSimpan.Click
        Try
            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "INSERT INTO TB_PARKIR (NoKendaraan, JenisKendaraan, JamMasuk, TanggalMasuk) VALUES (?, ?, ?, ?)"
            objCommand = New OleDbCommand(strSQL, myCon)

            ' Parameters
            objCommand.Parameters.AddWithValue("NoKendaraan", txtNoKendaraan.Text)
            objCommand.Parameters.AddWithValue("JenisKendaraan", dropJenisKendaraan.SelectedValue)
            objCommand.Parameters.AddWithValue("JamMasuk", txtJamMasuk.Text)
            ' Format the date to match the Access database requirements
            objCommand.Parameters.AddWithValue("TanggalMasuk", Convert.ToDateTime(dtTanggalMasuk.SelectedDate).ToString("yyyy-MM-dd HH:mm:ss"))

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

            strSQL = "SELECT * FROM TB_PARKIR ORDER BY NoKarcis ASC"
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
        txtNoKendaraan.Text = ""
    End Sub

    Private Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Call ClearObject()
    End Sub

End Class