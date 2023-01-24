<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="ContactExpert.aspx.cs" Inherits="ContactExpert" %>

<asp:Content ID="ContentHead"  ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="ContentBody"  ContentPlaceHolderID="BodyContent" Runat="Server">
<div class="container">
<asp:GridView Visible="false" ID="gvCE" runat="server" AutoGenerateColumns="true">
</asp:GridView>
</div>
<div class="container-fluid py-5">
<div class="row justify-content-center align-items-center">
        <div class="col-6">
            <div class="card custom1 box-shadow">
                <div class="card-header py-3 border-0 bg text-white">
                    <span class="card-title display-6">Contact Us</span>
                    <span class="text-white fs-normal d-block">Having any issues? Let us know</span>
                </div>
                <div class="card-body">
                        <div class="form-group py-2">
                            <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Name"/>
                            <asp:RequiredFieldValidator ID="txtNameVal" runat="server"  style="font-weight:normal; font-size:small; color:Red;" ErrorMessage="Required" ControlToValidate="txtName" ValidationGroup="ValidatorGpOne"/>
                        </div>
                        <div class="form-group py-2">
                            <asp:TextBox ID="txtSubject" runat="server" class="form-control" placeholder="Subject"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txtSubVal" runat="server" style="font-weight:normal; font-size:small; color:Red;" ErrorMessage="Required"
                            ControlToValidate="txtSubject" ValidationGroup="ValidatorGpOne"/>
                            <asp:RegularExpressionValidator ID="txtSubjectRVal" Display="Dynamic" ValidationGroup="valGpOne"
                                    runat="server" ControlToValidate="txtSubject" ErrorMessage="Use only alphanumerics, spaces - and , !" Style="font-weight: normal;
                                    font-size: small; color: Red;" ValidationExpression="[a-zA-Z\s\-\,\d]+"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group py-2">
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqtxtEmailVal" runat="server" style="font-weight:normal; font-size:small; color:Red;" ErrorMessage="Required" ControlToValidate="txtEmail" ValidationGroup="ValidatorGpOne"/>&nbsp;
                            <asp:RegularExpressionValidator ID="valRegEx" runat="server" style="font-weight:normal; font-size:small; color:Red;" ControlToValidate="txtEmail" ValidationExpression=".*@.*\..*" ErrorMessage="Invalid Email address." Display="dynamic" ValidationGroup="ValidatorGpOne"/>
                        </div>
                        <div class="form-group py-2">
                            <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine" 
                                class="form-control" placeholder="Message"/>
                            <asp:RequiredFieldValidator ID="txtBodyVal" runat="server" style="font-weight:normal; font-size:small; color:Red;" ErrorMessage="Required"
                            ControlToValidate="txtBody" ValidationGroup="ValidatorGpOne"/>
                            <asp:RegularExpressionValidator ID="txtBodyRVal" Display="Dynamic" ValidationGroup="valGpOne"
                                    runat="server" ControlToValidate="txtBody" ErrorMessage="Use only alphanumerics, spaces - and , !" Style="font-weight: normal;
                                    font-size: small; color: Red;" ValidationExpression="[a-zA-Z\s\-\,\d]+"></asp:RegularExpressionValidator>
                        </div>
                        <br />
                        <asp:Button ID="btnSend" runat="server" Text="Submit" OnClick="btnSend_Click" ValidationGroup="ValidatorGpOne" class="btn btn-outline-success"/>
                        <br />
                        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Green"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

