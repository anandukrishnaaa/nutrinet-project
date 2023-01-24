<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="BodyContent" runat="Server">
    <div class="container-fluid">
        <div class="row justify-content-center align-items-center" style="height: 80vh">
            <div class="col-5">
                <div class="card px-4 bg-opacity new-box-shadow">
                    <div class="card-header my-3 border-0 text-center transparent">
                        <asp:Image ID="ImgLogo" runat="server" ImageUrl="~/assets/favicon.png" Height="30px"
                            Width="40px" class="card-title fs-2 fw-light" />
                        <span class="card-title fs-2 fw-light">NutriNet Login</span>
                    </div>
                    <div class="card-body">
                        <div class="form-group mt-0 mb-4">
                            <asp:TextBox ID="txtUsername" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txtUserVal" runat="server" Style="font-weight: normal;
                                font-size: small; color: Red;" Display="Dynamic" ErrorMessage="Enter Username"
                                ControlToValidate="txtUsername" ValidationGroup="valGpOne"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group my-4">
                            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" class="form-control"
                                placeholder="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txtPassVal" runat="server" Style="font-weight: normal;
                                font-size: small; color: Red;" Display="Dynamic" ErrorMessage="Enter Password"
                                ControlToValidate="txtPass" ValidationGroup="valGpOne"></asp:RequiredFieldValidator>
                        </div>
                        <asp:Button ID="btnLogin" runat="server" class="btn btn-success me-2 form-control"
                            Text="Login" OnClick="btnLogin_Click" ValidationGroup="valGpOne" />
                    </div>
                    <div class="card-footer text-center my-3 border-0 transparent">
                        <a class="badge bg-primary p-2" href="UserRegistration.aspx?pg=ur" style="color: white;
                            text-decoration: none;">New here? Click here to Sign Up!</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
