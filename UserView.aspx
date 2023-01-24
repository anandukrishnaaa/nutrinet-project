<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="UserView.aspx.cs" Inherits="UserView" %>

<asp:Content ID="ContentHead"  ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="ContentBody"  ContentPlaceHolderID="BodyContent" Runat="Server">
<div class="container-fluid mt-5">
    <div class="row justify-content-center align-items-center">
            <div class="col-8 py-3 box-shadow">
                <asp:GridView ID="gvUsrInv" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" EmptyDataText="There is no health data to display yet." Visible="false">
                    <Columns>
                        <asp:BoundField DataField="UDB_Name" HeaderText="Name" SortExpression="UDB_Name"
                            HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="HT_Age" HeaderText="Age" SortExpression="HT_Age" ItemStyle-CssClass="visible-lg"
                            HeaderStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="HT_Height" HeaderText="Height" SortExpression="HT_Height"
                            ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="HT_Weight" HeaderText="Weight" SortExpression="HT_Weight"
                            ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="HT_HeartRate" HeaderText="Heart Rate" SortExpression="HT_HeartRate"
                            ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="HT_SugarLevel" HeaderText="Sugar Level" SortExpression="HT_SugarLevel"
                            ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="HT_Cholestrol" HeaderText="Cholestrol Level" SortExpression="HT_Cholestrol"
                            ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="HT_Platelet" HeaderText="Platelet Count" SortExpression="HT_Platelet"
                            ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                    </Columns>
                </asp:GridView>
                <asp:GridView ID="gvUSrView" runat="server" CssClass="table table-bordered table-hover" EmptyDataText="There is no health data to display yet."></asp:GridView>
            </div>
    </div>    
    <div class="row justify-content-center align-items-center mt-3">
        <div class="col-8 py-3 backGround">
            <asp:Label ID="lblSgr" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblPlt" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblChols" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="row justify-content-center align-items-center">
        <div class="col-8 py-3">
            <asp:HyperLink ID="lnkApp" Visible="false" runat="server" NavigateUrl="~/ReqAppointment.aspx?pg=a">Click here to set an appointment to check health.</asp:HyperLink>
        </div>
    </div>
</div>
</asp:Content>

