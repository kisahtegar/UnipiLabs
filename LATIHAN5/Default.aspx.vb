Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub optStatus_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optStatus.SelectedIndexChanged
        Try
            If optStatus.SelectedValue = "K" Then
                txtGajiPokok.Text = 2500000
            ElseIf optStatus.SelectedValue = "T" Then
                txtGajiPokok.Text = 3250000
            Else
                txtGajiPokok.Text = 0
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnHitung_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnHitung.Click
        Try

            Dim dblPph21, dblGajiPokok, dblTunjangan, dblGajiBersih As Double

            If txtGajiPokok.Text = "" Then
                MsgBox("Gaji Pokok Belum Ada")
            ElseIf txtTunjangan.Text = "" Then
                MsgBox("Tunjangan Belum Ada")
            Else
                dblGajiPokok = txtGajiPokok.Text
                dblTunjangan = txtTunjangan.Text
                dblPph21 = ((dblGajiPokok + dblTunjangan) * 5) / 100
                dblGajiBersih = (dblGajiPokok + dblTunjangan) - dblPph21

                txtPph.Text = dblPph21
                txtGajiBersih.Text = dblGajiBersih
            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class