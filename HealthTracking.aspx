<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true"
    CodeFile="HealthTracking.aspx.cs" Inherits="HealthTracking" %>

<asp:Content ID="ContentHead"  ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="ContentBody"  ContentPlaceHolderID="BodyContent" runat="Server">
<div class="container-fluid mt-2">
    <div class="row justify-content-center align-items-center">
            <div class="col-8 my-5">
                <div class="card box-shadow">
                    <div class="m-3 border-0">
                        <span class="card-title display-6">HEALTH UPDATE</span>
                    </div>
                    <div class="card-body row">
                        <div class="col align-self-center">
                            <div class="form-group">
                                <asp:Label ID="lblAge" runat="server" class="form-label" Text="Age"></asp:Label><asp:TextBox ID="txtAge" runat="server" Font-Size="Medium" class="form-control border-0 border-bottom" placeholder="Age (in years)" MaxLength="2"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtAgeVal" runat="server" ErrorMessage="Required!"
                                style="font-weight:normal; font-size:small; color:Red;" ControlToValidate="txtAge" ValidationGroup="ValidatorGpOne"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtAgeVal1" runat="server" ErrorMessage="Numeric Only" ControlToValidate="txtAge"
                                ValidationExpression="\d+" Style="font-weight: normal; font-size: small; color: Red;"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                            <asp:Label ID="lblHt" runat="server" class="form-label" Text="Height (in cm)"></asp:Label>
                                <asp:TextBox ID="txtHt" runat="server" Font-Size="Medium" class="form-control border-0 border-bottom" placeholder="Height (in cm)" MaxLength="3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtHtVal" runat="server" ErrorMessage="Required!"
                                style="font-weight:normal; font-size:small; color:Red;" ControlToValidate="txtHt" ValidationGroup="ValidatorGpOne"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtHtVal1" runat="server" ErrorMessage="Numeric Only" ControlToValidate="txtHt"
                                ValidationExpression="\d+" Style="font-weight: normal; font-size: small; color: Red;"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                            <asp:Label ID="lblWt" runat="server" class="form-label" Text="Weight (in kg)"></asp:Label>
                              <asp:TextBox ID="txtWt" runat="server" Font-Size="Medium" class="form-control border-0 border-bottom" placeholder="Weight (in kg)" MaxLength="3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtWtVal" runat="server" ErrorMessage="Required!"
                                style="font-weight:normal; font-size:small; color:Red;" ControlToValidate="txtWt" ValidationGroup="ValidatorGpOne"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtWtVal1" runat="server" ErrorMessage="Numeric Only" ControlToValidate="txtWt"
                                ValidationExpression="\d+" Style="font-weight: normal; font-size: small; color: Red;"></asp:RegularExpressionValidator>
                            </div>    
                        </div>
                        <div class="col">
                            <div class="form-group">
                            <asp:Label ID="lblHrtRt" runat="server" class="form-label" Text="Heart Rate (BPM)"></asp:Label>
                                <asp:TextBox ID="txtHrtRt" runat="server" Font-Size="Medium" class="form-control border-0 border-bottom" placeholder="Heart Rate (BPM)" MaxLength="3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtHrtRtVal" runat="server" ErrorMessage="Required!"
                                style="font-weight:normal; font-size:small; color:Red;" ControlToValidate="txtHrtRt" ValidationGroup="ValidatorGpOne"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtHrtRtVal1" runat="server" ErrorMessage="Numeric Only" ControlToValidate="txtHrtRt"
                                ValidationExpression="\d+" Style="font-weight: normal; font-size: small; color: Red;"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                            <asp:Label ID="lblSgr" runat="server" class="form-label" Text="Sugar Level (50-200 mg/dL)"></asp:Label>
                                <asp:TextBox ID="txtSgrLvl" runat="server" Font-Size="Medium" class="form-control border-0 border-bottom" placeholder="Sugar Level (mg/dL)" MaxLength="3"></asp:TextBox>
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
                            <asp:Label ID="lblCh" runat="server" class="form-label" Text="Cholesterol Level (150-300 mg/dL)"></asp:Label>
                                <asp:TextBox ID="txtChLvl" runat="server" Font-Size="Medium" class="form-control border-0 border-bottom" placeholder="Cholesterol Level (mg/dL)" MaxLength="3"></asp:TextBox>
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
                             <asp:Label ID="lblPlt" runat="server" class="form-label" Text="Platelet Count (1.5-4.0 lakh/microL)"></asp:Label>
                                <asp:TextBox ID="txtPlt" runat="server" Font-Size="Medium" class="form-control border-0 border-bottom" placeholder="Platelet Count (lakh/microL)" MaxLength="3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtPltVal" runat="server" ErrorMessage="Required!"
                                style="font-weight:normal; font-size:small; color:Red;" ControlToValidate="txtPlt" ValidationGroup="ValidatorGpOne"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtPltVal1" runat="server" ErrorMessage="Numeric Only" ControlToValidate="txtPlt"
                                    ValidationExpression="\d+" Style="font-weight: normal; font-size: small; color: Red;"></asp:RegularExpressionValidator>
                                <asp:RangeValidator ID="txtPltRval" runat="server" 
                                    ErrorMessage="Value out of range!" ControlToValidate="txtPlt" MaximumValue="5.0" 
                                    MinimumValue="1.0" style="font-weight:normal; font-size:small; color:Red;" 
                                    ValidationGroup="ValidatorGpOne" Type="Double"></asp:RangeValidator>
                            </div>    
                        </div>
                        
                        <div class="form-group mt-4">
                            <asp:Button ID="btnSearch" runat="server" Text="Update Health" Font-Size="Medium" OnClick="btnSearch_Click" class="btn btn-outline-primary form-control" ValidationGroup="ValidatorGpOne"/>                        
                        </div>
                        <div class="form-group mt-4">   
                            <asp:TextBox ID="txtGo" runat="server" Height="180px" ReadOnly="True"
                            TextMode="MultiLine" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</div>
</asp:Content>
