<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cuentas.aspx.cs" Inherits="Trabajo3.Cuentas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 395px">
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" />
&nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="idCuenta" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
            <br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Eliminar" />
&nbsp;<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Modificar" />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [Cuentas] WHERE [idCuenta] = @idCuenta" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" ProviderName="<%$ ConnectionStrings:cadena.ProviderName %>" SelectCommand="SELECT * FROM [Cuentas]" UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [idCuenta] = @idCuenta">
                <DeleteParameters>
                    <asp:Parameter Name="idCuenta" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="descripcion" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                    <asp:Parameter Name="idCuenta" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Cuentas] WHERE ([idCuenta] = @idCuenta)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListBox1" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
