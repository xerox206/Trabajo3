using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Trabajo3
{
    public partial class RegistrosContables : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                completarTabla();
            }    
        }
        private void completarTabla()
        {
            try
            {
                DataView dv = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);


                if (dv != null && dv.Count > 0)
                {
                    // Rellenar cabecera
                    TableRow headerRow = new TableRow();

                    TableCell headerCell1 = new TableCell();
                    headerCell1.Text = "ID";
                    headerRow.Cells.Add(headerCell1);

                    TableCell headerCell2 = new TableCell();
                    headerCell2.Text = "Descripcion";
                    headerRow.Cells.Add(headerCell2);

                    TableCell headerCell3 = new TableCell();
                    headerCell3.Text = "Categoria";
                    headerRow.Cells.Add(headerCell3);

                    TableCell headerCell4 = new TableCell();
                    headerCell4.Text = "Precio";
                    headerRow.Cells.Add(headerCell4);

                    Table1.Rows.Add(headerRow);

                    // Rellenar las filas
                    foreach (DataRowView rowView in dv)
                    {
                        DataRow row = rowView.Row;
                        TableRow tableRow = new TableRow();

                        TableCell cell1 = new TableCell();
                        cell1.Text = row["idRegistro"].ToString();
                        tableRow.Cells.Add(cell1);

                        TableCell cell2 = new TableCell();
                        cell2.Text = row["descripcion"].ToString();
                        tableRow.Cells.Add(cell2);

                        TableCell cell3 = new TableCell();
                        cell3.Text = row["tipo"].ToString();
                        tableRow.Cells.Add(cell3);

                        TableCell cell4 = new TableCell();
                        cell4.Text = row["monto"].ToString();
                        tableRow.Cells.Add(cell4);

                        Table1.Rows.Add(tableRow);
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", $"alert('Error');", true);
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource3.InsertParameters["monto"].DefaultValue = TextBox1.Text;
            SqlDataSource3.InsertParameters["idCuentas"].DefaultValue = DropDownList1.SelectedValue;
            SqlDataSource3.InsertParameters["idTipo"].DefaultValue = DropDownList2.SelectedValue;
            int result = SqlDataSource3.Insert();
            if (result != 0)
            {
                Label1.Text = "Se agrego " + result.ToString();
                completarTabla();
                TextBox1.Text = "";
            }
            else { Label1.Text = "No se agrego"; }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int result = SqlDataSource3.Delete();
            if (result != 0)
            {
                Label1.Text = "Se elimino " + result.ToString();
                completarTabla();
                TextBox1.Text = "";
            }
            else { Label1.Text = "No se elimino"; }
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);
            if (dv != null && dv.Count > 0)
            {
                DataRowView row = dv[0];
                TextBox1.Text = row["monto"].ToString();
                DropDownList1.SelectedValue = row["idCuentas"].ToString();
                DropDownList2.SelectedValue = row["idTipo"].ToString();
            }
            completarTabla();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlDataSource3.UpdateParameters["idRegistro"].DefaultValue = DropDownList3.SelectedValue;
            int result = SqlDataSource3.Update();
            if (result != 0)
            {
                Label1.Text = "Se modifico " + result.ToString();
                completarTabla();
                TextBox1.Text = "";
            }
            else { Label1.Text = "No se modifico"; }
        }
    }
}