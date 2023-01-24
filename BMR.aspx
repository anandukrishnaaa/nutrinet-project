<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="BMR.aspx.cs" Inherits="BMR" %>

<asp:Content ID="ContentHead"  ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="ContentBody"  ContentPlaceHolderID="BodyContent" Runat="Server">
<div class="container-fluid pb-5">
     <div class="row bg p-5 text-center mb-5">
        <h1 class="display-5 p-3 text-white fw-normal">Basal Metabolic Rate (BMR)</h1>
        <p class="lead fs-6 text-white">The basal metabolic rate (BMR) is the amount of energy that is expended at rest in a neutral environment after the digestive system has been inactive for about 12 hours. 
        It is the rate of one’s metabolism when waking in the morning after “fasting” during sleep.Weight control is related to BMR in that the higher the BMR the easier it is to burn unwanted calories that would be stored as fat.
        </p>
    </div>
    <div class="row justify-content-center align-items-center">
        <div class="col-8">
            <div class="card box-shadow">
                <div class="py-3 text-center display-6">
                    <span class="card-title">CALCULATOR</span>
                </div>
                <div class="card-body row">
                    <div class="col">
                        <div class="form-group py-2">
                        <asp:Label ID="lblAge" runat="server" class="form-label" Text="Age"></asp:Label>
                            <asp:TextBox ID="txtAge" runat="server" class="form-control border-0 border-bottom" placeholder="Age" MaxLength="2"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txtAgeVal" runat="server" style="font-weight:normal; font-size:small; color:Red;" ErrorMessage="Age Required" ControlToValidate="txtAge" ValidationGroup="valGrp1"> </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="txtAgeVal1" runat="server" ErrorMessage="Numeric Only" ControlToValidate="txtAge"
                            ValidationExpression="\d+" Style="font-weight: normal; font-size: small; color: Red;"></asp:RegularExpressionValidator>
                        </div>
                        
                        <div class="form-group py-2">
                        <asp:Label ID="lblHt" runat="server" class="form-label" Text="Height in cm"></asp:Label>
                            <asp:TextBox ID="txtHt" runat="server" class="form-control border-0 border-bottom" placeholder="Height in cm" MaxLength="3"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txtHtVal" runat="server" style="font-weight:normal; font-size:small; color:Red;" ErrorMessage="Height Required" ControlToValidate="txtHt" ValidationGroup="valGrp1"> </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="txtHtVal1" runat="server" ErrorMessage="Numeric Only" ControlToValidate="txtHt"
                            ValidationExpression="\d+" Style="font-weight: normal; font-size: small; color: Red;"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group py-2">
                        <asp:Label ID="lblWt" runat="server" class="form-label" Text="Weight in kg"></asp:Label>
                            <asp:TextBox ID="txtWt" runat="server" class="form-control border-0 border-bottom" placeholder="Weight in kg" MaxLength="3"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txtWtVal" runat="server" style="font-weight:normal; font-size:small; color:Red;" ErrorMessage="Weight Required" ControlToValidate="txtWt" ValidationGroup="valGrp1"> </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="txtWtVal1" runat="server" ErrorMessage="Numeric Only" ControlToValidate="txtWt"
                            ValidationExpression="\d+" Style="font-weight: normal; font-size: small; color: Red;"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group py-2">
                            <span class="fs-5 ms-3">Exercise</span>
                            <asp:RadioButtonList ID="exerciseList" runat="server" class="form-control border-0" CellPadding="5">
                                <asp:ListItem Value="ex1">&nbsp;Light exercise (1-3 days per week)</asp:ListItem>
                                <asp:ListItem Value="ex2">&nbsp;Moderate exercise (3-5 days per week)</asp:ListItem>
                                <asp:ListItem Value="ex3">&nbsp;Heavy exercise (6-7 days per week)</asp:ListItem>
                                <asp:ListItem Value="ex4">&nbsp;Very heavy exercise (twice per day)</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="exerciseListVal" runat="server" Style="font-weight: normal;
                             font-size: small; color: Red;"  ErrorMessage="Required"  ControlToValidate="exerciseList" ValidationGroup="valGrp1"></asp:RequiredFieldValidator>
                        </div>    
                    </div>
                    <div class="col align-self-center">
                        <div class="form-group py-2">
                            <span class="fs-5 ms-3">Gender</span>
                            <asp:RadioButtonList ID="genderList" runat="server" class="form-control border-0" CellPadding="5">
                                <asp:ListItem Value="M">&nbsp;Male</asp:ListItem>
                                <asp:ListItem Value="F">&nbsp;Female</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="genderListVal" runat="server" Style="font-weight: normal;
                            font-size: small; color: Red;"  ErrorMessage="Required" ControlToValidate="genderList" ValidationGroup="valGrp1"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group py-2">
                            <asp:Button ID="btnCalculateBMR" class="btn btn-outline-primary form-control w-25 fs-normal" runat="server" Text="Calculate BMR" onclick="btnCalculateBMR_Click" ValidationGroup="valGrp1" />
                        </div>
                        <div class="form-group py-2">
                            <asp:TextBox ID="txtBMR" runat="server" ReadOnly="true" height="100px" class="form-control output bg-light"></asp:TextBox>                                
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>  
</div>
</asp:Content>