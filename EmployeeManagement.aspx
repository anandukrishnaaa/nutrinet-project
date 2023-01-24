<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="EmployeeManagement.aspx.cs" Inherits="EmployeeManagement" %>

<asp:Content ID="ContentHead"  ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="ContentBody"  ContentPlaceHolderID="BodyContent" runat="Server">
<div id="dataTable" class="container-fluid my-5">
    <div class="row justify-content-center align-items-center mx-5">
        <div class="col-10 border p-4 mx-5 box-shadow">
            <span class="display-5 mb-3 d-block">Doctor Management Panel</span>
            <div class="row align-items-center">
                <div class="col-9">
                    <asp:TextBox ID="txtId" runat="server" ReadOnly="true" Width="50px" style="text-align: center" class="d-inline-block form-control w-25 mx-2" placeholder="Id"></asp:TextBox>
                
                    <asp:Button ID="btnApprove" runat="server" Text="Approve" OnClick="btnApprove_Click" class="btn btn-outline-success fs-normal mx-2" ValidationGroup="ValGpOne"/>
                    <asp:Button ID="btnRemove" runat="server" Text="Remove" OnClick="btnRemove_Click" class="btn btn-outline-danger fs-normal mx-2" ValidationGroup="ValGpOne"/>
                </div>
                <div class="col ms-auto ">
                    <asp:Label ID="lblEmp" runat="server" Text="No. Of Registered Employees : " />
                    <asp:Label ID="lblEmpCount" runat="server" Text="" class="fs-4"></asp:Label>
                </div>
            </div>
            <div class="my-3 ms-1">
                <asp:Label ID="lblApprove" runat="server" Text="Doctor Approved Successfully" Font-Bold="True" ForeColor="Green" Visible="False" style="text-align: center"></asp:Label>                
                <asp:Label ID="lblRemove" runat="server" Text="Doctor Removed Successfully" Font-Bold="True" ForeColor="Red" Visible="False" style="text-align: center"></asp:Label>
            </div>
            <asp:GridView ID="grdEmp" runat="server" CssClass="table table-bordered table-hover"
                AutoGenerateColumns="False" DataKeyNames="EDB_Id" EmptyDataText="There are no data records to display."
                AutoGenerateSelectButton="True" OnSelectedIndexChanged="grdEmp_SelectedIndexChanged">
                <SelectedRowStyle BackColor="#D9D9D9" Font-Bold="True" ForeColor="Black" />
                <Columns>
                    <asp:BoundField DataField="EDB_Id" HeaderText="Employee ID" ReadOnly="True" SortExpression="EDB_Id" />
                    <asp:BoundField DataField="EDB_Name" HeaderText="Employee Name" SortExpression="EDB_Name"
                        HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                    <asp:BoundField DataField="EDB_Address" HeaderText="Employee Address" SortExpression="EDB_Address"
                        ItemStyle-CssClass="visible-xs" HeaderStyle-CssClass="visible-xs" />
                    <asp:BoundField DataField="EDB_DOB" HeaderText="Date Of Birth" SortExpression="EDB_DOB"
                        HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                    <asp:BoundField DataField="EDB_Age" HeaderText="Age" SortExpression="EDB_Age" ItemStyle-CssClass="hidden-xs"
                        HeaderStyle-CssClass="hidden-xs" />
                    <asp:BoundField DataField="EDB_Gender" HeaderText="Gender" SortExpression="EDB_Gender"
                        ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                    <asp:BoundField DataField="EDB_Email" HeaderText="Email" SortExpression="EDB_Email"
                        HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                    <asp:BoundField DataField="EDB_Qualification" HeaderText="Qualification" SortExpression="EDB_Qualification"
                        HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                    <asp:BoundField DataField="EDB_Username" HeaderText="Username" SortExpression="EDB_Username"
                        HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                    <asp:BoundField DataField="EDB_Phone" HeaderText="Phone" SortExpression="EDB_Phone"
                        HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                    <asp:BoundField DataField="EDB_Status" HeaderText="Status" SortExpression="EDB_Status"
                        HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</div>
</asp:Content>
