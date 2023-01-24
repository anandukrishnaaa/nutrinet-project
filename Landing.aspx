<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Landing.aspx.cs" Inherits="Landing" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="BodyContent" Runat="Server">
<div class="container-fluid">
        <div class="row justify-content-center align-items-center text-white m-3">
            <div class="col">
                <div class="row justify-content-center">
                    <asp:Image ID="ImgLP" runat="server" ImageUrl="~/assets/lp-img.png"/>
                </div>                
            </div>
            <div class="col-7 p-3">
                <span class="display-2">Nutrinet.</span>
                <div class="row mt-4">
                    <div class="col lh-lg">
                        <p style="color:white;" class="fs-custom">Welcome to NutriNet, <br /> The future of health & fitness monitoring! Let our panel of curated & handpicked health & fitness professionals help you win back your life! 
                        <br />
                        Made for those who want to take care by those who care. Powered by innovation, Confidentiality & Trust.
                        </p>
                        <asp:HyperLink ID="HLSignUp" runat="server" NavigateUrl="~/UserRegistration.aspx?pg=ur" class="btn btn-primary mx-2 text-white">Sign Up</asp:HyperLink>
                        <asp:HyperLink ID="HLSignIn" runat="server" NavigateUrl="~/Login.aspx" class="m-2 text-white d-block">Already Registered ? Click here</asp:HyperLink>                                           
                    </div>
                </div>           
            </div>
        </div>
    </div>
</asp:Content>

