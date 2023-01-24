<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.master" AutoEventWireup="true" CodeFile="SetAppointment.aspx.cs" Inherits="SetAppointment" %>

<asp:Content ID="ContentHead"  ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="ContentBody"  ContentPlaceHolderID="BodyContent" Runat="Server">
<script type="text/jscript" src="assets/jquery-1.8.3.min.js"></script>
<script src="assets/datePicker_bootstrap-datepicker.js" type="text/jscript"></script>
<link rel="stylesheet" href="assets/datePicker_bootstrap-datepicker.css" type="text/css" />
<link rel="stylesheet" href="assets/timePicker_jquery.timepicker.min.css">
<script src="assets/timePicker_jquery.timepicker.min.js" type="text/javascript" ></script>
<div class="container-fluid m-5">
    <div class="row justify-content-center align-items-center">
        <div class="col-8 border p-4 box-shadow">
            <span class="display-5 mb-3 d-block">Manage Appointment</span>
            <span class="lead mb-3 d-block">Select a User</span>
            <asp:Panel ID="ViewReqPanel" runat="server">
                 <asp:GridView ID="gvShowApp" runat="server" CssClass="table table-bordered table-hover" AutoGenerateSelectButton="True" 
                    AutoGenerateColumns="false" EmptyDataText="There are no meal plans to display yet." OnSelectedIndexChanged="gvShow_SelectedIndexChanged">   
                    <SelectedRowStyle BackColor="#D9D9D9" Font-Bold="True" ForeColor="Black" /> 
                    <Columns>
                      <asp:BoundField DataField="M_Id" HeaderText="User Id" ReadOnly="True" />
                      <asp:BoundField DataField="M_Username" HeaderText="Username" ItemStyle-CssClass="visible-lg"
                          HeaderStyle-CssClass="visible-lg" ReadOnly="True" />
                      <asp:BoundField DataField="M_Expert" HeaderText="Expert In Charge" ItemStyle-CssClass="visible-lg"
                          HeaderStyle-CssClass="visible-lg" />
                      <asp:BoundField DataField="M_Msg" HeaderText="Message" ItemStyle-CssClass="visible-lg"
                          HeaderStyle-CssClass="visible-lg" />
                      <asp:BoundField DataField="M_Date" HeaderText="Date" ItemStyle-CssClass="visible-lg"
                          HeaderStyle-CssClass="visible-lg" />
                      <asp:BoundField DataField="M_Time" HeaderText="Time" ItemStyle-CssClass="visible-lg"
                          HeaderStyle-CssClass="visible-lg" />
                      <asp:BoundField DataField="M_Status" HeaderText="Status" ItemStyle-CssClass="visible-lg"
                          HeaderStyle-CssClass="visible-lg" />
                    </Columns>
                 </asp:GridView>
            </asp:Panel>
        </div>
        <div class="col me-5 p-4 pt-0">
            <asp:Panel ID="setApp" runat="server" Visible="true">
                <div class="row mb-2 text-center border-0">
                    <div class="col">
                        <asp:Label ID="lblSelUsr" runat="server" Text="ID" class="form-contorl"></asp:Label>
                    </div>
                    <div class="col">
                        <asp:Label ID="lblSelName" runat="server" Text="Name" class="form-contorl"></asp:Label>
                    </div>
                </div>
                <div class="card box-shadow">
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-sm col-form-label">Message </label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtMsgBox" TextMode="MultiLine" ReadOnly="true" runat="server" class="form-control mb-3 fs-normal" placeholder="Message" Rows="5"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm col-form-label">Appointment Date  </label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtAppDate" runat="server" ClientIDMode="Static" class="m-wrap span12 date form_datetime fs-normal form-control mb-3" placeholder="Appointment Date" MaxLength="10"></asp:TextBox>
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            var dp = $('#<%=txtAppDate.ClientID%>');
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
                        </div>
                        <div class="form-group row">
                            <label class="col-sm col-form-label">Expert In Charge </label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtExp" runat="server" ReadOnly="true" class="form-control fs-normal mb-3" placeholder="Expert In Charge"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtExpVal" runat="server" ControlToValidate="txtExp" ErrorMessage="Required" style="font-weight: normal; font-size: small; color: Red;" 
                                    ValidationGroup="valGpOne"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm col-form-label">Appointment Time </label>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtAppTime" runat="server" class="form-control fs-normal mb-3" TextMode="SingleLine" placeholder="Appointment Time"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtAppTimeVal" runat="server" ControlToValidate="txtAppTime" ErrorMessage="Required" style="font-weight: normal; font-size: small; color: Red;" 
                                    ValidationGroup="valGpOne"></asp:RequiredFieldValidator>
                                        <script type="text/javascript">
                                            $('#<%=txtAppTime.ClientID%>').timepicker({
                                                timeFormat: 'h:mm p',
                                                interval: 60,
                                                minTime: '9',
                                                maxTime: '6:00pm',
                                                defaultTime: '9',
                                                startTime: '09:00',
                                                dynamic: false,
                                                dropdown: true,
                                                scrollbar: true
                                            });
                                        </script>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-6">
                                 <asp:Button ID="btnSetApp" runat="server" class="btn btn-outline-success form-control fs-normal" OnClick="btnSetApp_Click" Text="Approve Appointment" ValidationGroup="valGpOne" />
                            </div>
                            <div class="col-6">
                            <asp:Button ID="btnReset" runat="server" class="btn btn-outline-primary form-control fs-normal" Text="Appointment Complete" OnClick="btnResetApp_Click" ValidationGroup="valGpOne" />
                            </div>
                        </div>
                        <asp:Label ID="lblMsg" runat="server" Text=" " Visible="False" ForeColor="Green"></asp:Label>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</div>
</asp:Content>

