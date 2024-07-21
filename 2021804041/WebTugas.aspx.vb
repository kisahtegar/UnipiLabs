Partial Public Class WebTugas
    Inherits System.Web.UI.Page

    Private Sub btnCalculate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCalculate.Click
        Try

            Dim jurusan As String = rbJurusan.SelectedValue
            Dim keberangkatan As String = rbKeberangkatan.SelectedValue
            Dim hargaTiket As Double = 0
            Dim ppn As Double = 0
            Dim jumlahTiket As Integer = 0
            Dim discount As Double = 0
            Dim totalHarga As Double
            Dim totalPpn As Double
            Dim totalBayar As Double

            ' Validation jurusan and keberangkatan cant be null atau empty
            If String.IsNullOrEmpty(jurusan) Then
                MsgBox("Jurusan Belum Di Pilih")
                Return
            End If
            If String.IsNullOrEmpty(keberangkatan) Then
                MsgBox("Keberangkatan Belum Di Pilih")
                Return
            End If

            ' Validation and convert jumlah tiket
            If txtJumlahTiket.Text = "" Then
                MsgBox("Jumlah Tiket Belum Di Input")
                Return
            ElseIf Not Integer.TryParse(txtJumlahTiket.Text, jumlahTiket) Then
                MsgBox("Jumlah tiket tidak valid")
                Return
            End If

            ' Switch cases
            Select Case jurusan
                Case "J"
                    If keberangkatan = "P" Then
                        hargaTiket = 320000
                        ppn = 0.04
                    ElseIf keberangkatan = "M" Then
                        hargaTiket = 370000
                        ppn = 0.05
                    End If
                Case "S"
                    If keberangkatan = "P" Then
                        hargaTiket = 480000
                        ppn = 0.04
                    ElseIf keberangkatan = "M" Then
                        hargaTiket = 540000
                        ppn = 0.05
                    End If
                Case "M"
                    If keberangkatan = "P" Then
                        hargaTiket = 560000
                        ppn = 0.04
                    ElseIf keberangkatan = "M" Then
                        hargaTiket = 610000
                        ppn = 0.04
                    End If
            End Select

            ' Calculate discount
            If jumlahTiket > 5 Or keberangkatan = "P" Then
                discount = (hargaTiket * jumlahTiket) * 0.05
            Else
                discount = 0
            End If

            ' Calculate harga, ppn, bayar
            totalHarga = hargaTiket * jumlahTiket
            totalPpn = totalHarga * ppn
            totalBayar = totalHarga + totalPPN - discount

            ' Binding data
            txtHargaTiket.Text = hargaTiket
            txtPpn.Text = totalPpn
            txtDiscount.Text = discount
            txtTotalHarga.Text = totalBayar

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        ' Bersihkan semua TextBox
        txtNoPemesanan.Text = String.Empty
        txtNama.Text = String.Empty
        txtJumlahTiket.Text = String.Empty
        txtHargaTiket.Text = String.Empty
        txtPpn.Text = String.Empty
        txtDiscount.Text = String.Empty
        txtTotalHarga.Text = String.Empty

        ' Mengatur ulang pilihan RadioButton
        rbJurusan.ClearSelection()
        rbKeberangkatan.ClearSelection()
    End Sub
End Class