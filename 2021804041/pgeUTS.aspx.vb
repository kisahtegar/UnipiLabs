Public Partial Class pgeUTS
    Inherits System.Web.UI.Page


    Private Sub btnCalculate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCalculate.Click
        Try
            Dim jenisPinjaman As String = rbJenisPinjaman.SelectedValue
            Dim besarPinjaman As Double = 0
            Dim bungaPinjaman As Double = 0
            Dim durasi As Double = 0
            Dim besarBunga As Double
            Dim pinjamanBunga As Double
            Dim cicilanBulan As Double


            If String.IsNullOrEmpty(jenisPinjaman) Then
                MsgBox("Jenis Pinjaman Belum di Pilih")
                Return
            End If

            If txtBesarPinjaman.Text = "" Then
                MsgBox("Besar Pinjaman Belum di Input")
                Return
            ElseIf Not Integer.TryParse(txtBesarPinjaman.Text, besarPinjaman) Then
                MsgBox("Besar Pinjaman Tidak Valid")
                Return
            End If


            ' Switch case
            Select Case jenisPinjaman
                Case "T"
                    bungaPinjaman = 0.05
                Case "B"
                    bungaPinjaman = 0.08
            End Select

            besarBunga = besarPinjaman * bungaPinjaman
            pinjamanBunga = besarPinjaman + besarBunga
            cicilanBulan = pinjamanBunga / txtDurasi.Text

            ' Binding data
            txtBesarBunga.Text = besarBunga
            txtBungaPinjaman.Text = bungaPinjaman
            txtPinjamanBunga.Text = pinjamanBunga
            txtCicilanBulan.Text = cicilanBulan

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        txtNama.Text = String.Empty
        txtNoAnggota.Text = String.Empty
        rbJenisPinjaman.ClearSelection()
        txtBesarPinjaman.Text = String.Empty
        txtBungaPinjaman.Text = String.Empty
        txtDurasi.Text = String.Empty
        txtBesarBunga.Text = String.Empty
        txtPinjamanBunga.Text = String.Empty
        txtCicilanBulan.Text = String.Empty
    End Sub
End Class