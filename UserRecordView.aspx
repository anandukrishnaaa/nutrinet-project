<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.master" AutoEventWireup="true"
    CodeFile="UserRecordView.aspx.cs" Inherits="UserRecordView" %>

<asp:Content ID="ContentHead"  ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="ContentBody"  ContentPlaceHolderID="BodyContent" runat="Server">
    <table width="100%">
        <tr>
            <td align="center">
                <table width="50%">
                    <tr>
                        <td style="text-align: center;">
                            <h1 align="center">Users Health Records</h1>
                            <h5>If value is 0, then the user has not entered any values yet.</h5>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:GridView ID="gvUserRecord" runat="server" Width="50%" EmptyDataText="There are no user records to view." CssClass="table table-striped table-bordered table-hover">
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
