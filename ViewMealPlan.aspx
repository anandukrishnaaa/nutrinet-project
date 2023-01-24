<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true"
    CodeFile="ViewMealPlan.aspx.cs" Inherits="ViewMealPlan" %>

<asp:Content ID="ContentHead"  ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="ContentBody"  ContentPlaceHolderID="BodyContent" runat="Server">
<div class="container-fluid mt-5">
    <div class="row justify-content-center align-content-center">
        <div class="col-3 mt-3">
            <div class="card py-5 box-shadow">
                <div class="card-body text-black" style="letter-spacing:.5em;">
                    <h1 class="text-center">Meal Plan</h1>
                    <h5 class="text-center"><asp:Label ID="lblDay" runat="server" align="center"></asp:Label></h5>
                </div>
            </div>
        </div>
        <div class="col-8 py-3 box-shadow">
            <asp:GridView ID="gvMPInv" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" EmptyDataText="There is no health data to display yet." Visible="false">
                <Columns>
                    <asp:BoundField DataField="MP_Monday" HeaderText="Monday" SortExpression="MP_Monday"
                    HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                    <asp:BoundField DataField="MP_Tuesday" HeaderText="Tuesday" SortExpression="MP_Tuesday"
                    ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                    <asp:BoundField DataField="MP_Wednesday" HeaderText="Wednesday" SortExpression="MP_Wednesday"
                    ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                    <asp:BoundField DataField="MP_Thursday" HeaderText="Thursday" SortExpression="MP_Thursday"
                    ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                    <asp:BoundField DataField="MP_Friday" HeaderText="Friday" SortExpression="MP_Friday"
                    ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                </Columns>
            </asp:GridView>
            
            <asp:GridView ID="gvMealPlan" runat="server" CssClass="table table-bordered table-hover" EmptyDataText="There are no meal plans to display yet."></asp:GridView>
        </div>  
    </div>
    <div class="row justify-content-center align-items-center">
        <div class="col-5 pb-5">
            <div class="form-group py-3">
                <asp:Label ID="lblPrg" runat="server" Text="Mark meal plan completed : "></asp:Label>
                <asp:Button ID="btnPrg" runat="server" Text="Done!" onclick="btnPrg_Click" class="btn btn-outline-success ms-3"/>
                 <asp:Label ID="lblWE" runat="server" Text="Enjoy! It's the Weekend! No Meal Restrictions Today!" class="fs-5" Visible="false"></asp:Label>
            </div>
        </div>
    </div> 
    <div class="row justify-content-evenly align-items-start mb-5">
        <div class="card col-3 p-5 box-shadow" style="height: 65vh;">
            <asp:Image ID="ImgM1" runat="server" ImageUrl="~/pdf/meal/mealplan.jpg"/>
            <span>Physical activity or exercise can improve your health and reduce the risk of developing several diseases like type 
            2 diabetes, cancer and cardiovascular disease.</span>
            <asp:HyperLink ID="HL1" runat="server" NavigateUrl="~/pdf/meal/2000CaloriePlan.pdf" Target="_search" class="mt-2">Read More</asp:HyperLink>
        </div>
        <div class="card col-3 p-5 box-shadow" style="height: 65vh;">
            <asp:Image ID="ImgM3" runat="server" ImageUrl="~/pdf/meal/mealplan2.jpg" />
            <span>Physical activity stimulates various brain chemicals that may leave you feeling happier, more relaxed and less anxious.
            You may also feel better about your appearance and yourself when you exercise regularly, which can boost your confidence and 
            improve your self-esteem.</span>
            <asp:HyperLink ID="HL3" runat="server" NavigateUrl="~/pdf/meal/MealPlanGuide.pdf" Target="_search" class="mt-2">Read More</asp:HyperLink>
        </div>
        <div class="card col-3 p-5 box-shadow" style="height: 65vh;">
            <asp:Image ID="ImgM2" runat="server" ImageUrl="~/pdf/meal/mealplan1.jpg" />
            <span>Exercise can help prevent excess weight gain or help maintain weight loss. When you engage in physical activity, you burn 
            calories. The more intense the activity, the more calories you burn.</span>
            <asp:HyperLink ID="HL2" runat="server" NavigateUrl="~/pdf/meal/28DayEatingPlan.pdf" Target="_search" class="mt-2">Read More</asp:HyperLink>
        </div>
    </div>
</div>
</asp:Content>
