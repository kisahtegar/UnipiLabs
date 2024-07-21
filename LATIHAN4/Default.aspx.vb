Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub btnHITUNG_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnHITUNG.Click
        Try
            Dim dblGAPOK As Double
            Dim dblTUNJANGAN As Double
            Dim dblPOTONGAN As Double
            Dim dblGABER As Double

            dblGAPOK = txtGAPOK.Text
            dblTUNJANGAN = txtTUNJANGAN.Text
            dblPOTONGAN = txtPOTONGAN.Text

            dblGABER = (dblGAPOK + dblTUNJANGAN) - dblPOTONGAN
            txtGABER.Text = dblGABER



        Catch ex As Exception
            MsgBox(ex.Message)

        End Try
    End Sub
End Class