<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrosContables.aspx.cs" Inherits="Trabajo3.RegistrosContables" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="idCuenta">
            </asp:DropDownList>
&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Tipo" DataValueField="idTipo">
            </asp:DropDownList>
&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" />
&nbsp;<asp:Button ID="Button2" runat="server" Text="Modificar" OnClick="Button2_Click" />
&nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />
            <asp:DropDownList ID="DropDownList3" runat="server" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="idRegistro" DataValueField="idRegistro">
            </asp:DropDownList>
            <asp:Button ID="Button3" runat="server" Text="Eliminar" OnClick="Button3_Click" />
            <br />
            <br />
            <asp:Table ID="Table1" CssClass="table" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" GridLines="Both">
</asp:Table>
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Cuentas]"></asp:SqlDataSource>
&nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Tipo]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [RegistroContable] WHERE [idRegistro] = @idRegistro" InsertCommand="INSERT INTO [RegistroContable] ([idTipo], [idCuentas], [monto]) VALUES (@idTipo, @idCuentas, @monto)" SelectCommand="SELECT * FROM [RegistroContable]" UpdateCommand="UPDATE [RegistroContable] SET [idTipo] = @idTipo, [idCuentas] = @idCuentas, [monto] = @monto WHERE [idRegistro] = @idRegistro">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="DropDownList3" Name="idRegistro" PropertyName="SelectedValue" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="idTipo" Type="Int32" />
                    <asp:Parameter Name="idCuentas" Type="Int32" />
                    <asp:Parameter Name="monto" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="monto" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="idCuentas" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownList2" Name="idTipo" PropertyName="SelectedValue" Type="Int32" />
                    <asp:Parameter Name="idRegistro" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT RegistroContable.idRegistro, RegistroContable.monto, Cuentas.descripcion, Tipo.Tipo FROM RegistroContable INNER JOIN Cuentas ON RegistroContable.idCuentas = Cuentas.idCuenta INNER JOIN Tipo ON RegistroContable.idTipo = Tipo.idTipo"></asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>"  SelectCommand="SELECT * FROM [RegistroContable] WHERE ([idRegistro] = @idRegistro)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList3" Name="idRegistro" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
