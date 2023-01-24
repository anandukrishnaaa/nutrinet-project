<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ContactResponse.aspx.cs" Inherits="ContactResponse" %>

<asp:Content ID="ContentHead"  ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="ContentBody"  ContentPlaceHolderID="BodyContent" Runat="Server">
<div class="container-fluid py-5">
    <div class="row justify-content-center align-items-center">
        <div class="col-9 border p-4 box-shadow">
            <span class="display-5 mb-3 d-block">Resolve Ticket</span>
            <div class="row align-items-center my-4">
                <div class="col-9">
                    <asp:TextBox ID="txtId" runat="server" ReadOnly="true" style="text-align: center;" class="d-inline-block form-control w-25" placeholder="Id"></asp:TextBox>
                
                    <asp:Button ID="btnMark" runat="server" Text="Mark ticket as resolved." 
                    onclick="btnMark_Click" class="btn btn-outline-success fs-normal mx-2" />
                    <asp:Button ID="btnUnmark" runat="server" Text="Mark ticket as Unresolved." 
                    onclick="btnUnmark_Click" class="btn btn-outline-primary fs-normal mx-2" />
                </div>
            </div>
            <asp:GridView ID="gvExpRsp" AutoGenerateSelectButton="true" runat="server" CssClass="table table-bordered table-hover" OnSelectedIndexChanged="gvExpRsp_SelectedIndexChanged" SelectedRowStyle-BackColor="AliceBlue"
            AutoGenerateColumns="False" DataKeyNames="CE_Id" EmptyDataText="There are no data records to display.">
            <SelectedRowStyle BackColor="#D9D9D9" Font-Bold="True" ForeColor="Black" />  
                <Columns>
                    <asp:BoundField DataField="CE_Id" HeaderText="Ticket Id" ReadOnly="True" SortExpression="CE_Id" />
                    <asp:BoundField DataField="CE_Username" HeaderText="Customer Name" SortExpression="CE_Username"
                        HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg">
                        <HeaderStyle CssClass="visible-lg"></HeaderStyle>
                        <ItemStyle CssClass="visible-lg"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="CE_Subject" HeaderText="Subject" SortExpression="CE_Subject"
                        ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg">
                        <HeaderStyle CssClass="visible-lg"></HeaderStyle>
                        <ItemStyle CssClass="visible-lg"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="CE_Contact" HeaderText="Contact" SortExpression="CE_Contact"
                        HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg">
                        <HeaderStyle CssClass="visible-lg"></HeaderStyle>
                        <ItemStyle CssClass="visible-lg"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="CE_Message" HeaderText="Message" SortExpression="CE_Message"
                        ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xl">
                        <HeaderStyle CssClass="hidden-xl"></HeaderStyle>
                        <ItemStyle CssClass="hidden-xs"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="CE_Status" HeaderText="Status" SortExpression="CE_Status"
                        ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xl">
                        <HeaderStyle CssClass="hidden-xl"></HeaderStyle>
                        <ItemStyle CssClass="hidden-xs"></ItemStyle>
                    </asp:BoundField>
            </Columns>
            </asp:GridView>
        </div>
    </div>
</div>
</asp:Content>

