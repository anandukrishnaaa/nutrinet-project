<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="UserRegistration.aspx.cs" Inherits="UserRegistration" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="BodyContent" runat="Server">
    <div class="container-fluid py-5">
        <div class="row justify-content-center align-items-center">
            <div class="col-8">
                <div class="card">
                    <div class="p-3 border-0">
                        <span class="card-title display-6">Create Account</span>
                        <span class="d-block text-muted fs-5 mt-2">Let's get started!</span>
                    </div>
                    <div class="card-body row justify-content-center">
                        <div class="col">
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Full Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtNameVal" runat="server" Style="font-weight: normal;
                                    font-size: small; color: Red;" Display="Dynamic" ValidationGroup="valGpOne" ErrorMessage="Required"
                                    ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtNameRVal" Display="Dynamic" ValidationGroup="valGpOne"
                                    runat="server" ControlToValidate="txtName" ErrorMessage="Only Characters" Style="font-weight: normal;
                                    font-size: small; color: Red;" ValidationExpression="[a-zA-Z\s]+"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" class="form-control"
                                    placeholder="Address"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="txtAddressVal" ValidationGroup="valGpOne" runat="server"
                                    Display="Dynamic" Style="font-weight: normal; font-size: small; color: Red;"
                                    ErrorMessage="Required" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="txtAddressRVal" Display="Dynamic" ValidationGroup="valGpOne"
                                    runat="server" ControlToValidate="txtAddress" ErrorMessage="Use only alphanumerics, spaces - and , !" Style="font-weight: normal;
                                    font-size: small; color: Red;" ValidationExpression="[a-zA-Z\s\-\,\d]+"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtdob" runat="server" autocomplete="off" ClientIDMode="Static"
                                    MaxLength="10" CssClass="m-wrap span12 date form_datetime form-control" placeholder="Date Of Birth"></asp:TextBox>
                                <script type="text/javascript">
                                    $(document).ready(function () {
                                        var dp = $('#<%=txtdob.ClientID%>');
                                        dp.datepicker({
                                            changeMonth: true,
                                            changeYear: true,
                                            format: "dd.mm.yyyy",
                                            language: "tr"
                                        }).on('changeDate', function (ev) {
                                            $(this).blur();
                                            $(this).datepicker('hide');
                                        });
                                    });
                                </script>
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtAge" runat="server" class="form-control" MaxLength="2"
                                    placeholder="Age"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtAgeVal" Display="Dynamic" runat="server" Style="font-weight: normal;
                                    font-size: small; color: Red;" ErrorMessage="Required" ValidationGroup="valGpOne"
                                    ControlToValidate="txtAge"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group py-2">
                                <span>Gender</span>
                                <asp:RadioButtonList ID="rbGender" runat="server" class="form-control" CellPadding="5">
                                    <asp:ListItem Value="Male">&nbsp;Male</asp:ListItem>
                                    <asp:ListItem Value="Female">&nbsp;Female</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="rbGenderVal" Display="Dynamic" runat="server" Style="font-weight: normal;
                                    font-size: small; color: Red;" ValidationGroup="valGpOne" ErrorMessage="Required"
                                    ControlToValidate="rbGender"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtEmail" autocomplete="off" runat="server" class="form-control"
                                    placeholder="Email Id"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="txtEmailVal" runat="server" ControlToValidate="txtEmail"
                                    Style="font-weight: normal; font-size: small; color: Red;" ValidationGroup="valGpOne"
                                    ErrorMessage="Required" />
                                <asp:RegularExpressionValidator ID="txtEmailVal1" Display="Dynamic" runat="server"
                                    ControlToValidate="txtEmail" Style="font-weight: normal; font-size: small; color: Red;"
                                    ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                    ValidationGroup="valGpOne" ErrorMessage="Invalid email address" />
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtUser" runat="server" autocomplete="off" placeholder="Username"
                                    class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtUserVal" Display="Dynamic" runat="server" Style="font-weight: normal;
                                    font-size: small; color: Red;" ValidationGroup="valGpOne" ErrorMessage="Required"
                                    ControlToValidate="txtUser"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtPass" runat="server" TextMode="Password" class="form-control"
                                    placeholder="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtPassVal" Display="Dynamic" ValidationGroup="valGpOne"
                                    runat="server" Style="font-weight: normal; font-size: small; color: Red;" ErrorMessage="Required"
                                    ControlToValidate="txtPass"> </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtPassRVal" ValidationGroup="valGpOne" Display="Dynamic"
                                    runat="server" ControlToValidate="txtPass" Style="font-weight: normal; font-size: small;
                                    color: Red;" ErrorMessage="Minimum password length is 8" ValidationExpression=".{8}.*" />
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtPassConf" runat="server" TextMode="Password" class="form-control"
                                    placeholder="Confirm Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtPassConfVal" Display="Dynamic" runat="server"
                                    Style="font-weight: normal; font-size: small; color: Red;" ValidationGroup="valGpOne"
                                    ErrorMessage="Required" ControlToValidate="txtPassConf"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtPassConfRVal" Display="Dynamic" runat="server"
                                    ControlToValidate="txtPassConf" Style="font-weight: normal; font-size: small;
                                    color: Red;" ValidationGroup="valGpOne" ErrorMessage="Minimum password length is 8"
                                    ValidationExpression=".{8}.*" />
                                <asp:CompareValidator ID="txtPassConfCVal" Display="Dynamic" runat="server" Style="font-weight: normal;
                                    font-size: small; color: Red;" ValidationGroup="valGpOne" ControlToCompare="txtPass"
                                    ErrorMessage="Passwords do not match!" ControlToValidate="txtPassConf"></asp:CompareValidator>
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtPhone" runat="server" class="form-control" placeholder="Phone Number"
                                    MaxLength="10"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtPhoneVal" Display="Dynamic" runat="server" Style="font-weight: normal;
                                    font-size: small; color: Red;" ValidationGroup="valGpOne" ErrorMessage="Required"
                                    ControlToValidate="txtPhone"> </asp:RequiredFieldValidator>&nbsp;
                                <asp:RegularExpressionValidator ID="txtPhoneRVal" runat="server" Display="Dynamic"
                                    Style="font-weight: normal; font-size: small; color: Red;" ValidationGroup="valGpOne"
                                    ControlToValidate="txtPhone" ErrorMessage="Invalid Phone Number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                            </div>
                            <asp:Button ID="btnUserReg" runat="server" ValidationGroup="valGpOne" class="btn btn-outline-primary me-2 fs-normal"
                                Text="Register" OnClick="btnUserReg_Click" />
                            <input type="reset" class="btn btn-outline-secondary fs-normal" value="Clear" />
                            <br />
                            <asp:Label ID="lblRegOK" runat="server" Text="You Have Successfully Registered."
                                Font-Bold="True" ForeColor="Red" Visible="False"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
