<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="CalorieTracker.aspx.cs" Inherits="CalorieTracker" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="ContentHead"  ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="ContentBody"  ContentPlaceHolderID="BodyContent" Runat="Server">
<div class="container-fluid my-5">
    <div class="row justify-content-center">
        <div class="col-8">
            <div class="card">
                <div class="row p-3 border-0">
                    <span class="col-8 titlecustom fs-5">Calorie Tracker : Track your daily calorie intake</span>
                    <asp:Label ID="lblDay" runat="server" class="col-4 titlecustom fs-5 text-end"></asp:Label>
                </div>
                <div class="card-body">
                    <div class="form-group row m-3">
                        <div class="col-8">
                          <asp:TextBox ID="txtCal" MaxLength="4" runat="server" placeholder="Enter Calorie Count for today : " class="form-control"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="txtCalVal" runat="server" ErrorMessage="Numeric Only" ControlToValidate="txtCal"
                                ValidationExpression="\d+" Style="font-weight: normal; font-size: small; color: Red;"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col">
                            <asp:Button ID="btnSubmitCal" runat="server" Text="Submit" onclick="btnSubmitCal_Click" class="form-control btn btn-outline-primary" />
                        </div>
                        <asp:Label ID="lblUpdate" runat="server" class="text-center mt-5 text-success"></asp:Label>           
                    </div>
                </div>                
            </div>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-8">
            <div class="card my-4 p-3">
            <div class="row justify-content-around align-items-center">
                <div class="col">
                <asp:Chart ID="chartCT" runat="server" AlternateText="Calorie Tracker Chart" Height="400px" Width="400px">
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
                <div class="col">
                    <asp:GridView ID="gvCTinfo" runat="server" CssClass="table table-bordered table-hover"
                            AutoGenerateColumns="False" DataKeyNames="UDB_Id" EmptyDataText="There are no data records to display.">
                            <Columns>
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
    </div>
</div>
</asp:Content>

