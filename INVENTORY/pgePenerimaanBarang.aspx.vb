Imports System
Imports System.Data
Imports System.Data.OleDb

Partial Public Class pgePenerimaanBarang
    Inherits System.Web.UI.Page
    Private strSQL As String
    Private objDataTable As DataTable
    Private objReader As OleDbDataReader
    Private objAdapter As OleDbDataAdapter
    Private objReaderExists As OleDbDataReader
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
            strCon = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Dev\Projects\UnipiLabs\INVENTORY\INVENTORY.mdb;"

            If Not IsPostBack Then
                Call PopulateBarang()
                Call ListGrid()
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub PopulateBarang()
        Try
            ddlBarang.Items.Clear()
            myCon = New OleDbConnection(strCon)
            objDataTable = New DataTable
            myCon.Open()
            strSQL = "SELECT KD_BRG,NM_BRG FROM TBL_BARANG ORDER BY KD_BRG ASC"
            objCommand = New OleDbCommand(strSQL, myCon)
            objReader = objCommand.ExecuteReader(CommandBehavior.Default)
            If objReader.HasRows Then
                ddlBarang.Items.Add("")
                While objReader.Read
                    ddlBarang.Items.Add(objReader("KD_BRG") & "-" & objReader("NM_BRG"))
                End While
            End If
            objCommand.Dispose()
            objReader.Close()
            myCon.Close()
            objCommand = Nothing
            objReader = Nothing
            myCon = Nothing
        Catch ex As Exception
        End Try
    End Sub


    Private Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        If txtNomor.Text = "" Then
            MsgBox("Nomor penerimaan tidak boleh kosong")
            txtNomor.Focus()
        ElseIf ddlBarang.Text = "" Then
            MsgBox("Kode barang tidak boleh kosong")
            ddlBarang.Focus()
        ElseIf txtQty.Text = "" Then
            MsgBox("Quantity tidak boleh kosong")
            txtQty.Focus()
        Else
            Try
                Erase arrBarang
                arrBarang = Split(ddlBarang.Text, "-")
                strKodeBarang = arrBarang(0)

                myCon = New OleDbConnection(strCon)
                myCon.Open()

                strSQL = "SELECT * FROM TBL_PENERIMAAN WHERE NO_PENERIMAAN = '" & txtNomor.Text & "' AND KD_BRG = '" & strKodeBarang & "'"
                objCommand = New OleDbCommand(strSQL, myCon)
                objReaderExists = objCommand.ExecuteReader()

                If objReaderExists.HasRows Then
                    objReaderExists.Close()
                    ' Update
                    strSQL = "UPDATE TBL_PENERIMAAN SET TGL_TERIMA = '" & dtTglTrans.SelectedDate & "', QTY = " & CInt(txtQty.Text) & " WHERE NO_PENERIMAAN = '" & txtNomor.Text & "' AND KD_BRG  = '" & strKodeBarang & "'"
                    objCommand = New OleDbCommand(strSQL, myCon)


                    If objCommand.ExecuteNonQuery() Then

                    End If

                Else
                    objReaderExists.Close()
                    ' Insert

                    strSQL = "INSERT INTO TBL_PENERIMAAN(NO_PENERIMAAN, TGL_TERIMA, KD_BRG, QTY) VALUES('" & txtNomor.Text & "', '" & dtTglTrans.SelectedDate & "', '" & strKodeBarang & "', " & txtQty.Text & ")"
                    objCommand = New OleDbCommand(strSQL, myCon)

                    If objCommand.ExecuteNonQuery() Then
                        strSQL = "SELECT * FROM TBL_STOCK WHERE KD_BRG = '" & strKodeBarang & "'"
                        objCommand = New OleDbCommand(strSQL, myCon)
                        objReader = objCommand.ExecuteReader(CommandBehavior.Default)

                        If objReader.HasRows Then
                            objReader.Read()
                            dblQtyIn = objReader("QTY_IN")
                            dblQtyAkhir = objReader("QTY_AKHIR")
                            dblQtyOut = objReader("QTY_OUT")

                            dblQtyIn = dblQtyIn + CInt(txtQty.Text)
                            dblQtyAkhir = dblQtyIn - dblQtyOut

                            strSQL = "UPDATE TBL_STOCK SET QTY_IN = " & dblQtyIn & ", QTY_AKHIR = " & dblQtyAkhir & " WHERE KD_BRG='" & strKodeBarang & "'"
                            objCommand = New OleDbCommand(strSQL, myCon)
                            objCommand.ExecuteNonQuery()
                        Else
                            strSQL = "INSERT INTO TBL_STOCK(KD_BRG, QTY_IN, QTY_OUT, QTY_AKHIR) VALUES('" & strKodeBarang & "', " & txtQty.Text & ", 0, " & txtQty.Text & ")"
                            objCommand = New OleDbCommand(strSQL, myCon)
                            objCommand.ExecuteNonQuery()
                        End If
                        objReader.Close()
                        MsgBox("DATA SUDAH DISIMPAN")
                    Else
                        MsgBox("DATA TIDAK DAPAT DISIMPAN")
                    End If

                End If

                

                Call ListGrid()
                myCon.Close()
                objCommand = Nothing
                objReader = Nothing
                myCon = Nothing
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        End If
    End Sub

    Private Sub ListGrid()
        Try
            objDataset = New DataSet
            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "SELECT B.NO_PENERIMAAN, B.TGL_TERIMA, B.KD_BRG, A.NM_BRG, A.HRG_SAT, B.QTY, (A.HRG_SAT * B.QTY) AS TOT_HRG FROM TBL_BARANG A, TBL_PENERIMAAN B WHERE A.KD_BRG = B.KD_BRG ORDER BY B.NO_PENERIMAAN, B.KD_BRG ASC"
            objAdapter = New OleDbDataAdapter(strSQL, myCon)
            objAdapter.Fill(objDataset)
            grdList.DataSource = objDataset
            grdList.DataBind()

            myCon.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub grdList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdList.SelectedIndexChanged
        Try
            txtNomor.Text = Trim(grdList.SelectedRow.Cells(1).Text)
            dtTglTrans.SelectedDate = CDate(grdList.SelectedRow.Cells(2).Text)
            ddlBarang.Text = Trim(grdList.SelectedRow.Cells(3).Text) & "-" & Trim(grdList.SelectedRow.Cells(4).Text)
            txtQty.Text = CDbl(grdList.SelectedRow.Cells(6).Text)
            txtHarga.Text = CDbl(grdList.SelectedRow.Cells(7).Text)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class