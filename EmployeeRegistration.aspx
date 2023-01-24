<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true"
    CodeFile="EmployeeRegistration.aspx.cs" Inherits="EmployeeRegistration" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="BodyContent" runat="Server">
    <div class="container-fluid py-5">
        <div class="row justify-content-center align-items-center">
            <div class="col-8">
                <div class="card custom1">
                    <div class="p-3 border-0">
                        <span class="card-title display-6">Add Doctor</span>
                    </div>
                    <div class="card-body row justify-content-center">
                        <div class="col">
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Full Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtNameVal" Display="Dynamic" runat="server" Style="font-weight: normal;
                                    font-size: small; color: Red;" ErrorMessage="Required" ValidationGroup="valGpOne"
                                    ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtNameRVal" Display="Dynamic" runat="server"
                                    ControlToValidate="txtName" ErrorMessage="Only Characters" Style="font-weight: normal;
                                    font-size: small; color: Red;" ValidationExpression="[a-zA-Z\.\s]+" ValidationGroup="valGpOne"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" class="form-control"
                                    placeholder="Address"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="txtAddressVal" Display="Dynamic" runat="server" Style="font-weight: normal;
                                    font-size: small; color: Red;" ErrorMessage="Required" ValidationGroup="valGpOne"
                                    ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
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
                                <asp:TextBox ID="txtAge" MaxLength="2" runat="server" class="form-control" placeholder="Age"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtAgeVal" Display="Dynamic" runat="server" Style="font-weight: normal;
                                    font-size: small; color: Red;" ErrorMessage="Required" ValidationGroup="valGpOne"
                                    ControlToValidate="txtAge">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group py-2">
                                <span>Gender</span>
                                <asp:RadioButtonList ID="rbGender" runat="server" class="form-control" CellPadding="5">
                                    <asp:ListItem Value="Male">&nbsp;Male</asp:ListItem>
                                    <asp:ListItem Value="Female">&nbsp;Female</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="rbGenderVal" Display="Dynamic" runat="server" Style="font-weight: normal;
                                    font-size: small; color: Red; text-align: ;" ValidationGroup="valGpOne" ErrorMessage="Required"
                                    ControlToValidate="rbGender"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Email Id"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtEmailVal" Display="Dynamic" runat="server" ControlToValidate="txtEmail"
                                    Style="font-weight: normal; font-size: small; color: Red;" ValidationGroup="valGpOne"
                                    ErrorMessage="Required" />
                                <asp:RegularExpressionValidator ID="txtEmailRVal" Display="Dynamic" runat="server"
                                    ControlToValidate="txtEmail" ValidationGroup="valGpOne" Style="font-weight: normal;
                                    font-size: small; color: Red;" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                    ErrorMessage="Invalid email address" />
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtQual" runat="server" class="form-control" placeholder="Qualification"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtQualVal" Display="Dynamic" runat="server" ValidationGroup="valGpOne"
                                    ControlToValidate="txtQual" Style="font-weight: normal; font-size: small; color: Red;"
                                    ErrorMessage="Required" />
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtUser" runat="server" placeholder="Username" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtUserVal" Display="Dynamic" runat="server" Style="font-weight: normal;
                                    font-size: small; color: Red;" ValidationGroup="valGpOne" ErrorMessage="Required"
                                    ControlToValidate="txtUser"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtPass" runat="server" TextMode="Password" class="form-control"
                                    placeholder="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtPassVal" Display="Dynamic" runat="server" Style="font-weight: normal;
                                    font-size: small; color: Red;" ValidationGroup="valGpOne" ErrorMessage="Required"
                                    ControlToValidate="txtPass"> </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtPassRVal" ValidationGroup="valGpOne" Display="Dynamic"
                                    runat="server" ControlToValidate="txtPass" Style="font-weight: normal; font-size: small;
                                    color: Red;" ErrorMessage="Minimum password length is 8" ValidationExpression=".{8}.*" />
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtPassConf" Display="Dynamic" runat="server" TextMode="Password"
                                    class="form-control" placeholder="Confirm Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtPassConfVal" Display="Dynamic" runat="server"
                                    Style="font-weight: normal; font-size: small; color: Red;" ValidationGroup="valGpOne"
                                    ErrorMessage="Required" ControlToValidate="txtPassConf"> </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtPassConfRVal" Display="Dynamic" runat="server"
                                    ControlToValidate="txtPass" Style="font-weight: normal; font-size: small; color: Red;"
                                    ValidationGroup="valGpOne" ErrorMessage="Minimum password length is 8" ValidationExpression=".{8}.*" />
                                <asp:CompareValidator ID="txtPassConfCVal" Display="Dynamic" runat="server" Style="font-weight: normal;
                                    font-size: small; color: Red;" ControlToCompare="txtPass" ErrorMessage="Passwords do not match!"
                                    ValidationGroup="valGpOne" ControlToValidate="txtPassConf"></asp:CompareValidator>
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtPhone" runat="server" class="form-control" MaxLength="10" placeholder="Phone Number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtPhoneVal" Display="Dynamic" runat="server" Style="font-weight: normal;
                                    font-size: small; color: Red;" ValidationGroup="valGpOne" ErrorMessage="Required"
                                    ControlToValidate="txtPhone"> </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtPhoneRVal" runat="server" Display="Dynamic"
                                    Style="font-weight: normal; font-size: small; color: Red;" ValidationGroup="valGpOne"
                                    ControlToValidate="txtPhone" ErrorMessage="Invalid Phone Number!" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                            </div>
                            <asp:Button ID="btnEmpReg" runat="server" Text="Register" ValidationGroup="valGpOne"
                                class="btn btn-outline-primary me-2 fs-normal" OnClick="btnEmpReg_Click" />
                            <input type="reset" class="btn btn-outline-secondary fs-normal" value="Clear" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
