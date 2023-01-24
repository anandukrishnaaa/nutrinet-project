<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.master" AutoEventWireup="true" CodeFile="EmpCalTrack.aspx.cs" Inherits="EmpCalTrack" %>

<asp:Content ID="ContentHead"  ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="ContentBody"  ContentPlaceHolderID="BodyContent" Runat="Server">
<div class="container-fluid my-5">
    <div class="row justify-content-center align-items-center">
        <div class="col-8">
            <div class="card p-4 box-shadow">
                <span class="col-8 titlecustom fs-5">Calorie Tracker : User Calorie Intake</span>
                <div class="card-body">
                    <asp:GridView ID="gvCalTrk" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="UDB_Id" CssClass="table table-bordered table-hover" 
                        AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvCalTrk_SelectedIndexChanged"
                        EmptyDataText="There is no data to display yet.">
                        <SelectedRowStyle BackColor="#D9D9D9" Font-Bold="True" ForeColor="Black" />    
                        <Columns>
                            <asp:BoundField DataField="UDB_Id" HeaderText="User ID" ReadOnly="True" SortExpression="UDB_Id" />
                            <asp:BoundField DataField="UDB_Name" HeaderText="User Name" SortExpression="UDB_Name"
                                HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="CT_AVG" HeaderText="Average Calorie Intake" SortExpression="CT_AVG"
                                ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="CT_SUM" HeaderText="Total Calorie Intake" SortExpression="CT_SUM"
                                HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        </Columns>
                     </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    <div class="row justify-content-center align-content-center">
        <div class="col-4">
            <div class="card my-2 px-5">
            <span class="titlecustom fs-5 text-center">Calorie Tracker : Chart</span>                
                <asp:Chart ID="chartCT" runat="server" AlternateText="Calorie Tracker Chart">
                    <Series>
                        <asp:Series ChartType="Line" Name="Calories" XValueMember="CT_Date" YValueMembers="CT_Cals"
                                    IsValueShownAsLabel="true" IsVisibleInLegend="true" YValuesPerPoint="2">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="chartCTArea">
                                    <AxisX Title="Date" LineColor="Gray">
                                        <MajorGrid LineColor="Gray" />
                                    </AxisX>
                                    <AxisY Title="Calories" LineColor="Gray">
                                        <MajorGrid LineColor="Gray" />
                                    </AxisY>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
        </div>
    </div>
</div>
</asp:Content>

