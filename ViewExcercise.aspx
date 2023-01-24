<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" 
    CodeFile="ViewExcercise.aspx.cs" Inherits="ViewExcercise" %>

<asp:Content ID="ContentHead"  ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="ContentBody"  ContentPlaceHolderID="BodyContent" Runat="Server">
<div class="container-fluid mt-5">
    <div class="row justify-content-center align-items-center">
        <div class="col-3 align-self-start mt-3">
            <div class="card py-5 box-shadow">
                <div class="card-body text-black" style="letter-spacing:.5em;">
                    <h1 class="text-center">Exercise Plan</h1>
                    <h5 class="text-center"><asp:Label ID="lblDay" runat="server" align="center"></asp:Label></h5>
                </div>
            </div>
        </div>
            <div class="col-8 py-3 box-shadow">
                <asp:GridView ID="gvExInv" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" EmptyDataText="There is no health data to display yet." Visible="false">
                    <Columns>
                        <asp:BoundField DataField="Ex_Pushups" HeaderText="Pushups (reps.)" SortExpression="Ex_Pushups"
                        HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="Ex_JumpJacks" HeaderText="Jumping Jacks (reps.)" SortExpression="Ex_JumpJacks"
                        ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="Ex_DeclPushups" HeaderText="Decline Pushups (reps.)" SortExpression="Ex_DeclPushups"
                        ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="Ex_DiamondPushups" HeaderText="Diamond Pushups (reps.)" SortExpression="Ex_DiamondPushups"
                        ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="Ex_WideArmPushups" HeaderText="Wide Arm Pushups (reps.)" SortExpression="Ex_WideArmPushups"
                        ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="Ex_CobraStrech" HeaderText="Cobra Strech (mins.)" SortExpression="Ex_CobraStrech"
                        ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="Ex_ChestStrech" HeaderText="Chest Strech (mins.)" SortExpression="Ex_ChestStrech"
                        ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="Ex_Yoga" HeaderText="Yoga (mins.)" SortExpression="Ex_Yoga"
                        ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                    </Columns>
                </asp:GridView>
                
                <asp:GridView ID="gvExcercise" runat="server" CssClass="table table-bordered table-hover" EmptyDataText="There are no excercise plans to display yet."></asp:GridView>
            </div>
        
    </div>
    <div class="row justify-content-center align-items-center">
        <div class="col-5 pb-5">
            <div class="form-group py-3">
                <asp:Label ID="lblPrg" runat="server" Text="<h5>Mark excercise plan completed : </h5>"></asp:Label>
                <asp:Button ID="btnPrg" runat="server" Text="Done!" onclick="btnPrg_Click" class="btn btn-outline-success ms-3"/>
                 <asp:Label ID="lblWE" runat="server" Text="Enjoy! It's the Weekend! No Excercise Today!" Visible="false" class="fs-5"></asp:Label>
            </div>
        </div>
     </div>
     <div class="row justify-content-evenly align-items-start mb-5">
        <div class="card col-3 p-5 box-shadow" style="height: 65vh;">
            <asp:Image ID="ImgEx1" runat="server" ImageUrl="~/pdf/excercise/exercise2.png" />
            Physical activity or exercise can improve your health and reduce the risk of developing several diseases like type 2 diabetes, cancer and cardiovascular disease
            <asp:HyperLink ID="HL1" runat="server" NavigateUrl="~/pdf/excercise/fullbodyplan.pdf" Target="_search" class="mt-2">Read More</asp:HyperLink>
        </div>
        <div class="card col-3 p-5 box-shadow" style="height: 65vh;">
            <asp:Image ID="ImgEx2" runat="server" ImageUrl="~/pdf/excercise/exercise.gif" />
            Exercise can help prevent excess weight gain or help maintain weight loss. When you engage in physical activity, you burn calories. The more intense the activity, the more calories you burn.
            <asp:HyperLink ID="HL2" runat="server" NavigateUrl="~/pdf/excercise/exercisebenifits.pdf" Target="_search" class="mt-2">Read More</asp:HyperLink>
        </div>
        <div class="card col-3 p-5 box-shadow" style="height: 65vh;">
            <asp:Image ID="ImgEx3" runat="server" ImageUrl="~/pdf/excercise/excercise3.png" />
            Physical activity stimulates various brain chemicals that may leave you feeling happier, more relaxed and less anxious.
            You may also feel better about your appearance and yourself when you exercise regularly, which can boost your confidence and improve your self-esteem.
            <asp:HyperLink ID="HL3" runat="server" NavigateUrl="~/pdf/excercise/mentalhealthexercise.pdf" Target="_search" class="mt-2">Read More</asp:HyperLink>
        </div>
     </div>
</div>
</asp:Content>

