<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.master" AutoEventWireup="true"
    CodeFile="UserManagement.aspx.cs" Inherits="UserManagement" %>

<asp:Content ID="ContentHead"  ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="ContentBody"  ContentPlaceHolderID="BodyContent" runat="Server">

<div class="container-fluid my-5">
    <div class="row justify-content-center align-items-center mx-5">
        <div class="col-10 border p-4 mx-5 box-shadow">
            <span class="display-5 mb-3 d-block">User Management Panel</span>
            <div class="row align-items-center">
                <div class="col-9">
                    <asp:TextBox ID="txtId" runat="server" ReadOnly="true" style="text-align: center;" class="d-inline-block form-control w-25 mx-2" placeholder="Id"></asp:TextBox>
                
                    <asp:Button ID="btnApprove" runat="server" Text="Approve" OnClick="btnApprove_Click" class="btn btn-outline-success fs-normal mx-2" ValidationGroup="ValGpOne" />
                    <asp:Button ID="btnRemove" runat="server" Text="Remove" OnClick="btnRemove_Click" class="btn btn-outline-danger fs-normal mx-2" ValidationGroup="ValGpOne" />
                </div>
                <div class="col ms-auto ">
                    <asp:Label class="" ID="lblUsr" runat="server" Text="No. Of Registered Users : " />
                    <asp:Label class="fs-4" ID="lblUsrCount" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="my-3 ms-1">
                <asp:Label ID="lblApprove" runat="server" Text="Approve Successfully" Font-Bold="True" ForeColor="Green" Visible="False" Style="text-align: center"></asp:Label>
                <asp:Label ID="lblRemove" runat="server" Text="Remove Successfully" Font-Bold="True" ForeColor="Red" Visible="False" Style="text-align: center"></asp:Label>
            </div>
            <asp:GridView ID="grdUsr" runat="server" CssClass="table table-bordered table-hover"
                AutoGenerateColumns="False" DataKeyNames="UDB_Id" EmptyDataText="There are no data records to display."
                AutoGenerateSelectButton="True" OnSelectedIndexChanged="grdUsr_SelectedIndexChanged">
                <SelectedRowStyle BackColor="#D9D9D9" Font-Bold="True" ForeColor="Black" />
                <Columns>
                    <asp:BoundField DataField="UDB_Id" HeaderText="User ID" ReadOnly="True" SortExpression="UDB_Id" />
                    <asp:BoundField DataField="UDB_Name" HeaderText="User Name" SortExpression="UDB_Name"
                        HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                    <asp:BoundField DataField="UDB_Address" HeaderText="User Address" SortExpression="UDB_Address"
                        ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                    <asp:BoundField DataField="UDB_DOB" HeaderText="Date Of Birth" SortExpression="UDB_DOB"
                        HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                    <asp:BoundField DataField="UDB_Age" HeaderText="Age" SortExpression="UDB_Age" ItemStyle-CssClass="hidden-xs"
                        HeaderStyle-CssClass="hidden-xs" />
                    <asp:BoundField DataField="UDB_Gender" HeaderText="Gender" SortExpression="UDB_Gender"
                        ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                    <asp:BoundField DataField="UDB_Email" HeaderText="Email" SortExpression="UDB_Email"
                        HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                    <asp:BoundField DataField="UDB_Username" HeaderText="Username" SortExpression="UDB_Username"
                        HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                    <asp:BoundField DataField="UDB_Phone" HeaderText="Phone" SortExpression="UDB_Phone"
                        HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                    <asp:BoundField DataField="UDB_Status" HeaderText="Status" SortExpression="UDB_Status"
                        HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</div>
</asp:Content>
