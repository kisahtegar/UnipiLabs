Imports System
Imports System.Data
Imports System.Data.OleDb

Partial Public Class payment
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
                dtTanggalKeluar.SelectedDate = DateTime.Now
                txtJamKeluar.Text = DateTime.Now.ToString("HH:mm:ss")
                Call ListGrid()
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btncari_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btncari.Click
        Try
            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "SELECT * FROM TB_PARKIR WHERE NoKarcis = @NoKarcis"
            objCommand = New OleDbCommand(strSQL, myCon)
            objCommand.Parameters.AddWithValue("@NoKarcis", txtNoKarcis.Text)

            Dim reader As OleDbDataReader = objCommand.ExecuteReader()
            If reader.Read() Then
                txtNoKendaraan.Text = reader("NoKendaraan").ToString()
                txtJenisKendaraan.Text = reader("JenisKendaraan").ToString()
                dtTanggalMasuk.SelectedDate = DateTime.Parse(reader("TanggalMasuk").ToString())
                txtJamMasuk.Text = reader("JamMasuk").ToString()

                Dim vehicleType As String = txtJenisKendaraan.Text
                Dim tarif As Decimal = 0

                ' Set Tarif based on vehicle type
                If vehicleType = "Mobil" Then
                    tarif = 5000 ' Example base rate for Mobil
                ElseIf vehicleType = "Motor" Then
                    tarif = 3000 ' Example base rate for Motor
                End If

                txtTarif.Text = tarif.ToString()
            Else
                MsgBox("No Karcis tidak ditemukan.")
                ClearObject()
            End If

            myCon.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnkembalian_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnkembalian.Click
        Try
            Dim tarif As Decimal = Decimal.Parse(txtTarif.Text)
            Dim bayar As Decimal = Decimal.Parse(txtBayar.Text)
            Dim kembalian As Decimal = bayar - tarif

            If kembalian < 0 Then
                MsgBox("Jumlah uang yang dibayarkan kurang.")
            Else
                txtKembalian.Text = kembalian.ToString()
            End If
        Catch ex As Exception
            MsgBox("Input tidak valid. Pastikan 'Bayar' diisi dengan angka.")
        End Try
    End Sub

    Private Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Call ClearObject()
    End Sub

    Private Sub ListGrid()
        Try
            objDataset = New DataSet
            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "SELECT * FROM TB_PAYMENT ORDER BY NoPayment ASC"
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
        txtNoKarcis.Text = ""
        txtNoKendaraan.Text = ""
        txtJenisKendaraan.Text = ""
        dtTanggalMasuk.SelectedDate = Nothing
        txtJamMasuk.Text = ""
        txtTarif.Text = ""
        txtBayar.Text = ""
        txtKembalian.Text = ""
    End Sub

End Class