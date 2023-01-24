<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.master" AutoEventWireup="true" CodeFile="EmployeeEdit.aspx.cs" Inherits="EmployeeEdit" %>

<asp:Content ID="ContentHead"  ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="ContentBody"  ContentPlaceHolderID="BodyContent" Runat="Server">
 <h1 align="center">
        Modify User Details</h1>
    <div class="container">
        <table width="100%" height="400px">
            <tr>
                <td>
                    <asp:Label ID="lblName" runat="server" Text="Name" ForeColor="Black"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="txtNameVal" runat="server" Style="font-weight: normal;
                        font-size: small; color: Red;" ErrorMessage="Required" ControlToValidate="txtName" ValidationGroup="ValGpOne"> </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LblAddress" runat="server" Text="Address"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="txtAddressVal" runat="server" Style="font-weight: normal;
                        font-size: small; color: Red;" ErrorMessage="Required" ControlToValidate="txtAddress" ValidationGroup="ValGpOne"> </asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr>
                    <td>
                        <asp:Label ID="lbldoB" runat="server" Text="Date Of Birth"></asp:Label>
                    </td>
                    <td>
                   <%-- <input  ID="txtdoB" runat="server" placeholder="Date Of Birth" type="date" onchange="DateSelectionChanged()"/>
                    <script type="text/javascript">
                        function DateSelectionChanged() {
                            var today = new Date();
                            var dob = new Date(document.getElementById('<%=txtdoB.ClientID%>').value);
                            var months = (today.getMonth() - dob.getMonth() + (12 * (today.getFullYear() - dob.getFullYear())));
                            document.getElementById('<%=txtAge.ClientID%>').value = Math.round(months / 12);
                        }
                    </script>--%>
                    </td>
                </tr>
            <tr>
                <td>
                    <asp:Label ID="lblAge" runat="server" Text="Age"></asp:Label>&nbsp;
                </td>
                <td>
                    <asp:TextBox ID="txtAge" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblGen" runat="server" Text="Gender"></asp:Label>
                </td>
                <td>
                   <asp:TextBox ID="txtGen" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEmail" runat="server" Text="Email Id"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="txtEmailVal" runat="server" ControlToValidate="txtEmail"
                        Style="font-weight: normal; font-size: small; color: Red;" ErrorMessage="Required" ValidationGroup="ValGpOne"/>&nbsp;&nbsp;
                    <asp:RegularExpressionValidator ID="txtEmailVal1" runat="server" ControlToValidate="txtEmail"
                        Style="font-weight: normal; font-size: small; color: Red;" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                        ErrorMessage="Invalid email address" ValidationGroup="ValGpOne" />
                </td>
            </tr>
             <tr>
                    <td>
                        <asp:Label ID="lblQual" runat="server" Text="Qualification"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtQual" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
            <tr>
                <td>
                    <asp:Label ID="lblUser" runat="server" Text="Username"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUser" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPass" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="txtPassVal" runat="server" Style="font-weight: normal;
                        font-size: small; color: Red;" ErrorMessage="Required" ControlToValidate="txtPass" ValidationGroup="ValGpOne"> </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPassConf" runat="server" Text="Confirm Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassConf" runat="server" TextMode="Password"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="txtPassConfVal" runat="server" Style="font-weight: normal;
                        font-size: small; color: Red;" ErrorMessage="Required" ControlToValidate="txtPassConf" ValidationGroup="ValGpOne"> </asp:RequiredFieldValidator>&nbsp;&nbsp;
                    <asp:CompareValidator ID="txtPassConfVal1" runat="server" Style="font-weight: normal;
                        font-size: small; color: Red;" ControlToCompare="txtPass" ErrorMessage="Passwords do not match!"
                        ControlToValidate="txtPassConf" ValidationGroup="ValGpOne"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPhone" runat="server" Text="Phone Number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="txtPhoneVal" runat="server" Style="font-weight: normal;
                        font-size: small; color: Red;" ErrorMessage="Required" ControlToValidate="txtPhone" ValidationGroup="ValGpOne"> </asp:RequiredFieldValidator>&nbsp;
                    &nbsp;
                    <asp:RegularExpressionValidator ID="txtPhoneVal1" runat="server" Style="font-weight: normal;
                        font-size: small; color: Red;" ControlToValidate="txtPhone" ErrorMessage="Invalid Phone Number"
                        ValidationExpression="[0-9]{10}" ValidationGroup="ValGpOne"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <br />
            <br />
            <tr>
                <th colspan="2" align="center">
                    <br />
                   <%-- <asp:Button ID="btnEmpUpdate" runat="server" class="btn btn-outline-success" Text="Update"
                        OnClick="btnUserReg_Click" ValidationGroup="ValGpTwo" />&nbsp;&nbsp;
                    <input type="reset" class="btn btn-outline-secondary" value="Clear" />--%>
                </th>
            </tr>
            <tr>
                <th colspan="2"><br />
                    <asp:Label ID="lblRegOK" runat="server" Text="You Have Successfully Updated."
                        Font-Bold="True" ForeColor="Green" Visible="False"></asp:Label>
                </th>
            </tr>
        </table>
    </div>
</asp:Content>

