<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="BMI.aspx.cs" Inherits="Default2" %>

<asp:Content ID="ContentHead"  ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="ContentBody"  ContentPlaceHolderID="BodyContent" Runat="Server">
<div class="container-fluid pb-5">
    <div class="row bg p-5 text-center mb-5">
        <h1 class="display-5 p-3 text-white fw-normal">Body Mass Index (BMI)</h1>
        <p class="lead fs-6 text-white">Body mass index is a value derived from the mass and height of a person. The BMI is defined as the body mass divided by the square of the body height, and is expressed in units of kg/m², resulting from mass in kilograms and height in metres.
        A high BMI can indicate high body fatness. BMI screens for weight categories that may lead to health problems, but it does not diagnose the body fatness or health of an individual.</p>
    </div>
    <div class="row justify-content-center align-items-center">
        <div class="col-8">
            <div class="card box-shadow">
                <div class="py-3 text-center display-6">
                    <span class="card-title">CALCULATOR</span>
                </div>
                <div class="card-body row my-4">
                    <div class="col">
                        <div class="form-group my-4">
                        <asp:Label ID="lblHt" runat="server" class="form-label" Text="Height in cm"></asp:Label> 
                            <asp:TextBox ID="txtHt" runat="server" class="form-control border-0 border-bottom" placeholder="Height in cm" MaxLength="3"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txtHtVal" runat="server" Style="font-weight: normal; font-size: small; color: Red;" ErrorMessage="Height Required" ControlToValidate="txtHt" ValidationGroup="valGrp1"> </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="txtHtRVal" ControlToValidate="txtHt" runat="server"
                                        ErrorMessage="Numbers only!" ValidationGroup="valGrp1" Style="font-weight: normal;
                                        font-size: small; color: Red;" Display="Dynamic" ValidationExpression="\d+">
                                    </asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group my-4">
                        <asp:Label ID="lblWt" runat="server" class="form-label" Text="Weight in kg"></asp:Label>
                            <asp:TextBox ID="txtWt" runat="server" class="form-control border-0 border-bottom" placeholder="Weight in kg" MaxLength="3"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txtWtVal" runat="server" style="font-weight: normal;
                            font-size: small; color: Red;" ErrorMessage="Weight Required" ControlToValidate="txtWt" ValidationGroup="valGrp1"> </asp:RequiredFieldValidator>  
                              <asp:RegularExpressionValidator ID="txtWtRVal" ControlToValidate="txtWt" runat="server"
                                        ErrorMessage="Numbers only!" ValidationGroup="valGrp1" Style="font-weight: normal;
                                        font-size: small; color: Red;" Display="Dynamic" ValidationExpression="\d+">
                                    </asp:RegularExpressionValidator>  
                        </div>
                        <div class="form-group my-4 align-content-center">
                            <asp:Button ID="btnCalculateBMI"  class="btn btn-outline-primary me-2 form-control w-25 fs-normal" runat="server" Text="Calculate BMI" ValidationGroup="valGrp1" OnClick="btnCalculateBMI_Click" />
                        </div>    
                    </div>
                    <div class="col">
                        <div class="form-group my-4">
                                <asp:TextBox ID="txtBMI" runat="server" ReadOnly="true" height="150px" class="form-control output bg-light"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>  
</div>
</asp:Content>