<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.master" AutoEventWireup="true" CodeFile="EmpEdit.aspx.cs" Inherits="EmpEdit" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="BodyContent" Runat="Server">
<div class="container-fluid py-5">
        <div class="row justify-content-center align-items-center">
            <div class="col-8">
                <div class="card custom1">
                    <div class="p-3 border-0">
                        <span class="card-title display-6">Edit Profile</span>
                    </div>
                    <div class="card-body row justify-content-center">
                        <div class="col">
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Full Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtNameVal" runat="server" Style="font-weight: normal;
                                    font-size: small; color: Red;" ValidationGroup="valGpOne" ErrorMessage="Required"
                                    ControlToValidate="txtName"></asp:RequiredFieldValidator>&nbsp;
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
                            <div class="form-group py-3">
                                <asp:TextBox ID="txtdob" runat="server" ReadOnly="true" autocomplete="off" ClientIDMode="Static"
                                    MaxLength="10" CssClass="form-control" placeholder="Date Of Birth"></asp:TextBox>
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtGender" ReadOnly="true" autocomplete="off" runat="server" class="form-control"
                                    placeholder="Gender"></asp:TextBox>
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtEmail" autocomplete="off" runat="server" class="form-control"
                                    placeholder="Email Id"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="txtEmailVal" runat="server" ControlToValidate="txtEmail"
                                    Style="font-weight: normal; font-size: small; color: Red;" ValidationGroup="valGpOne"
                                    ErrorMessage="Required" />&nbsp;
                                <asp:RegularExpressionValidator ID="txtEmailVal1" Display="Dynamic" runat="server"
                                    ControlToValidate="txtEmail" Style="font-weight: normal; font-size: small; color: Red;"
                                    ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                    ValidationGroup="valGpOne" ErrorMessage="Invalid email address" />
                            </div>
                             <div class="form-group py-2">
                                <asp:TextBox ID="txtUser" runat="server" ReadOnly="true" autocomplete="off" placeholder="Username"
                                    class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtUserVal" Display="Dynamic" runat="server" Style="font-weight: normal;
                                    font-size: small; color: Red;" ValidationGroup="valGpOne" ErrorMessage="Required"
                                    ControlToValidate="txtUser"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" class="form-control"
                                    placeholder="New Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtNewPassVal" Display="Dynamic" ValidationGroup="valGpOne"
                                    runat="server" Style="font-weight: normal; font-size: small; color: Red;" ErrorMessage="Required"
                                    ControlToValidate="txtNewPass"> </asp:RequiredFieldValidator>&nbsp;
                                <asp:RegularExpressionValidator ID="txtNewPassRVal" ValidationGroup="valGpOne" Display="Dynamic"
                                    runat="server" ControlToValidate="txtNewPass" Style="font-weight: normal; font-size: small;
                                    color: Red;" ErrorMessage="Minimum password length is 8" ValidationExpression=".{8}.*" />
                            </div>
                              <asp:CompareValidator ID="txtNewPassCOVal" runat="server"  Style="font-weight: normal; font-size: small;
                                    color: Red;" ControlToValidate="txtNewPass" ValidationGroup="valGpOne" ErrorMessage="Select a  new password!" Display="Dynamic" Operator="NotEqual"></asp:CompareValidator>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtPassConf" runat="server" TextMode="Password" class="form-control"
                                    placeholder="Confirm Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtPassConfVal" runat="server"
                                    Style="font-weight: normal; font-size: small; color: Red;" ValidationGroup="valGpOne"
                                    ErrorMessage="Required" ControlToValidate="txtPassConf"></asp:RequiredFieldValidator>&nbsp;
                                <asp:RegularExpressionValidator ID="txtPassConfRVal" Display="Dynamic" runat="server"
                                    ControlToValidate="txtPassConf" Style="font-weight: normal; font-size: small;
                                    color: Red;" ValidationGroup="valGpOne" ErrorMessage="Minimum password length is 8"
                                    ValidationExpression=".{8}.*" />&nbsp;
                                <asp:CompareValidator ID="txtPassConfCVal" Display="Dynamic" runat="server" Style="font-weight: normal;
                                    font-size: small; color: Red;" ValidationGroup="valGpOne" ControlToCompare="txtNewPass"
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
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtOldPass" runat="server" TextMode="Password" class="form-control"
                                    placeholder="Old Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtOldPassVal" Display="Dynamic" ValidationGroup="valGpOne"
                                    runat="server" Style="font-weight: normal; font-size: small; color: Red;" ErrorMessage="Required"
                                    ControlToValidate="txtOldPass"> </asp:RequiredFieldValidator>&nbsp;
                                <asp:CompareValidator ID="txtOldPassCVal" Display="Dynamic" runat="server" Style="font-weight: normal;
                                    font-size: small; color: Red;" ValidationGroup="valGpOne" ErrorMessage="Passwords do not match!"
                                    ControlToValidate="txtOldPass" ValueToCompare="<%_oldpass %>"></asp:CompareValidator>&nbsp;
                                <asp:RegularExpressionValidator ID="txtPassRVal" ValidationGroup="valGpOne" Display="Dynamic"
                                    runat="server" ControlToValidate="txtOldPass" Style="font-weight: normal; font-size: small;
                                    color: Red;" ErrorMessage="Minimum password length is 8" ValidationExpression=".{8}.*" />
                            </div>
                            <asp:Button ID="btnUserUpdate" runat="server" ValidationGroup="valGpOne" class="btn btn-outline-primary me-2"
                                Text="Update" OnClick="btnUserUpdate_Click" />
                            <input type="reset" class="btn btn-outline-secondary" value="Clear" />
                            <br />
                            <asp:Label ID="lblUpdateOK" runat="server" Text="You have successfully updated your details."
                                Font-Bold="True" ForeColor="Red" Visible="False"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

