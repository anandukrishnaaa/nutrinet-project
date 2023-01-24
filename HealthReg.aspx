<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HealthReg.aspx.cs" Inherits="HealthReg" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="BodyContent" Runat="Server">
<div class="container-fluid py-5">
        <div class="row justify-content-center align-items-center">
         <div class="col-7 card p-3">
         <div class="p-3 border-0">
                        <span class="card-title display-6">Fill in your health details</span>
                        <span class="d-block text-muted fs-5 mt-2">Let us know how healthy you are!</span>
                    </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtHt" runat="server" Font-Size="Medium" class="form-control border-0 border-bottom" placeholder="Height (in cm)" MaxLength="3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtHtVal" runat="server" ErrorMessage="Required!"
                                style="font-weight:normal; font-size:small; color:Red;" ControlToValidate="txtHt" ValidationGroup="ValidatorGpOne"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtHtVal1" runat="server" ErrorMessage="Numeric Only" ControlToValidate="txtHt"
                                ValidationExpression="\d+" Style="font-weight: normal; font-size: small; color: Red;"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                              <asp:TextBox ID="txtWt" runat="server" Font-Size="Medium" class="form-control border-0 border-bottom" placeholder="Weight (in kg)" MaxLength="3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtWtVal" runat="server" ErrorMessage="Required!"
                                style="font-weight:normal; font-size:small; color:Red;" ControlToValidate="txtWt" ValidationGroup="ValidatorGpOne"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtWtVal1" runat="server" ErrorMessage="Numeric Only" ControlToValidate="txtWt"
                                ValidationExpression="\d+" Style="font-weight: normal; font-size: small; color: Red;"></asp:RegularExpressionValidator>
                            </div>    
                            <div class="form-group">
                                <asp:TextBox ID="txtHrtRt" runat="server" Font-Size="Medium" class="form-control border-0 border-bottom" placeholder="Heart Rate (BPM)" MaxLength="3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtHrtRtVal" runat="server" ErrorMessage="Required!"
                                style="font-weight:normal; font-size:small; color:Red;" ControlToValidate="txtHrtRt" ValidationGroup="ValidatorGpOne"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtHrtRtVal1" runat="server" ErrorMessage="Numeric Only" ControlToValidate="txtHrtRt"
                                ValidationExpression="\d+" Style="font-weight: normal; font-size: small; color: Red;"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtSgrLvl" runat="server" Font-Size="Medium" class="form-control border-0 border-bottom" placeholder="Sugar Level (50-200 mg/dL)" MaxLength="3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtSgrLvlVal" runat="server" ErrorMessage="Required!"
                                style="font-weight:normal; font-size:small; color:Red;" ControlToValidate="txtSgrLvl" ValidationGroup="ValidatorGpOne"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="txtSgrLvlRval" runat="server" 
                                    ErrorMessage="Value out of range!" ControlToValidate="txtSgrLvl" MaximumValue="200" 
                                    MinimumValue="50" style="font-weight:normal; font-size:small; color:Red;" 
                                    ValidationGroup="ValidatorGpOne" Type="Integer"></asp:RangeValidator>
                                <asp:RegularExpressionValidator ID="txtSgrLvlVal1" runat="server" ErrorMessage="Numeric Only" ControlToValidate="txtSgrLvl"
                                ValidationExpression="\d+" Style="font-weight: normal; font-size: small; color: Red;"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtChLvl" runat="server" Font-Size="Medium" class="form-control border-0 border-bottom" placeholder="Cholesterol Level (150-350 mg/dL)" MaxLength="3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtChLvlVal" runat="server" ErrorMessage="Required!"
                                style="font-weight:normal; font-size:small; color:Red;" ControlToValidate="txtChLvl" ValidationGroup="ValidatorGpOne"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="txtChLvlRval" runat="server" 
                                    ErrorMessage="Value out of range!" ControlToValidate="txtChLvl" MaximumValue="350"
                                    MinimumValue="150" style="font-weight:normal; font-size:small; color:Red;" 
                                    ValidationGroup="ValidatorGpOne" Type="Integer"></asp:RangeValidator>
                                    <asp:RegularExpressionValidator ID="txtChLvlVal1" runat="server" ErrorMessage="Numeric Only" ControlToValidate="txtChLvl"
                                    ValidationExpression="\d+" Style="font-weight: normal; font-size: small; color: Red;"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtPlt" runat="server" Font-Size="Medium" class="form-control border-0 border-bottom" placeholder="Platelet Count (1.5-5.0 lakh/microL)" MaxLength="3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtPltVal" runat="server" ErrorMessage="Required!"
                                style="font-weight:normal; font-size:small; color:Red;" ControlToValidate="txtPlt" ValidationGroup="ValidatorGpOne"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtPltVal1" runat="server" ErrorMessage="Numeric Only" ControlToValidate="txtPlt"
                                    ValidationExpression="\d+" Style="font-weight: normal; font-size: small; color: Red;"></asp:RegularExpressionValidator>
                                <asp:RangeValidator ID="txtPltRval" runat="server" 
                                    ErrorMessage="Value out of range!" ControlToValidate="txtPlt" MaximumValue="5.0" 
                                    MinimumValue="1.0" style="font-weight:normal; font-size:small; color:Red;" 
                                    ValidationGroup="ValidatorGpOne" Type="Double"></asp:RangeValidator>
                            </div>
                        <div class="form-group mt-4">
                        <asp:Button ID="btnUserSumbit" runat="server" Text="Update Health And Proceed" Font-Size="Medium" OnClick="btnUserSumbit_Click" class="btn btn-outline-primary form-control" ValidationGroup="ValidatorGpOne"/>            
                        </div>
                    </div>
        </div>    
    </div>
</asp:Content>

