<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="ReqAppointment.aspx.cs" Inherits="ReqAppointment" %>

<asp:Content ID="ContentHead"  ContentPlaceHolderID="HeadContent" Runat="Server">
<script type="text/jscript" src="assets/jquery-1.8.3.min.js"></script>
<script src="assets/datePicker_bootstrap-datepicker.js" type="text/jscript"></script>
<link rel="stylesheet" href="assets/datePicker_bootstrap-datepicker.css" type="text/css" />
<link rel="stylesheet" href="assets/timePicker_jquery.timepicker.min.css">
<script src="assets/timePicker_jquery.timepicker.min.js" type="text/javascript" ></script>
</asp:Content>
<asp:Content ID="ContentBody"  ContentPlaceHolderID="BodyContent" Runat="Server">
<div class="container-fluid mt-5">
    <div class="row justify-content-center align-items-center">
        <div class="col-8 box-shadow">
            <asp:GridView ID="gvReqApp" runat="server" AutoGenerateColumns="true" Visible="false">
            </asp:GridView>
            <div class="row justify-content-center align-items-center border">
                <div class="col-4 mx-5">
                    <div class="border-end border-4">
                        <span class="display-6" style="color:#469feb;">Schedule<br />Appointment</span>
                    </div>
                </div>
                <div class="col">
                    <div class="card border-0 custom1 my-3">
                        <div class="card-body">
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtId" runat="server" Visible="False"
                                 CssClass="form-control" placeholder="Id" ></asp:TextBox>                        
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtName" runat="server" ReadOnly="True" CssClass="form-control" placeholder="Name"></asp:TextBox>
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" placeholder="Msg Body" CssClass="form-control"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="txtMsgVal" ValidationGroup="valGpOne" runat="server"
                                    Display="Dynamic" Style="font-weight: normal; font-size: small; color: Red;"
                                    ErrorMessage="Required" ControlToValidate="txtMsg"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txtMsgRVal" Display="Dynamic" ValidationGroup="valGpOne"
                                    runat="server" ControlToValidate="txtMsg" ErrorMessage="Use only alphanumerics, spaces - and , !" Style="font-weight: normal;
                                    font-size: small; color: Red;" ValidationExpression="[a-zA-Z\s\-\,\d]+"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtDate" autocomplete="off" runat="server" ClientIDMode="Static"  MaxLength="10" CssClass="m-wrap span12 date form_datetime form-control" placeholder="Appointment Date"></asp:TextBox>
                                 <script type="text/javascript">
                                     $(document).ready(function () {
                                         var dp = $('#<%=txtDate.ClientID%>');
                                         dp.datepicker({
                                             changeMonth: true,
                                             changeYear: true,
                                             format: "dd/mm/yyyy",
                                             language: "tr",
                                             startDate: '0d',
                                             endDate: '+1m'
                                         }).on('changeDate', function (ev) {
                                             $(this).blur();
                                             $(this).datepicker('hide');
                                         });
                                     });
                                 </script>
                            </div>
                            <div class="form-group py-2">
                                <asp:TextBox ID="txtAppTime" runat="server" TextMode="SingleLine" CssClass="form-control" placeholder="Appointment Time"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtAppTimeVal" runat="server" 
                                ControlToValidate="txtAppTime" ErrorMessage="Required" 
                                style="font-weight: normal; font-size: small; color: Red;" 
                                ValidationGroup="valGpOne"></asp:RequiredFieldValidator>
                                <script type="text/javascript">
                                    $('#<%=txtAppTime.ClientID%>').timepicker({
                                        timeFormat: 'h:mm p',
                                        interval: 60,
                                        minTime: '9',
                                        maxTime: '6:00pm',
                                        startTime: '09:00',
                                        dynamic: false,
                                        dropdown: true,
                                        scrollbar: true
                                    });
                                    </script>
                            </div>
                            <div class="form-group py-2">
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="ValGpTwo" CssClass="form-control"/>                        
                            </div>
                            <div class="form-group text-center py-2 my-3 backGround">
                                <asp:Label ID="lblAppEx" runat="server" Visible="false" Text=" "></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
