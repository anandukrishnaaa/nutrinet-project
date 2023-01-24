<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeMaster.master" AutoEventWireup="true"
    CodeFile="SetExcercise.aspx.cs" Inherits="SetExcercise" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="BodyContent" runat="Server">
    <div class="container-fluid my-5">
        <div class="row justify-content-center align-items-center mx-5">
            <div class="col-9 border p-4 box-shadow">
                <span class="display-5 mb-3 d-block">Exericse Plan</span>
                <asp:Label ID="lblDay" runat="server" class="fs-3"></asp:Label>
                <asp:Button ID="btnShowHT" runat="server" Text="Show Health" class="fs-normal btn btn-outline-secondary mb-3 mx-3"
                    OnClick="btnShowHT_Click" />
                <asp:Button ID="btnShowMP" runat="server" Text="Show Meal Plan" class="fs-normal btn btn-outline-secondary mb-3"
                    OnClick="btnShowMP_Click" />
                <asp:Panel ID="HealthPanel" runat="server" Visible="False">
                    <asp:GridView ID="gvHealth" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover"
                        EmptyDataText="There are no User Health Data to display yet.">
                        <Columns>
                            <asp:BoundField DataField="UDB_Id" HeaderText="User ID" ReadOnly="True" SortExpression="UDB_Id" />
                            <asp:BoundField DataField="UDB_Name" HeaderText="User Name" SortExpression="UDB_Name"
                                HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="HT_Age" HeaderText="User Age" SortExpression="HT_Age"
                                ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="UDB_Gender" HeaderText="Gender" SortExpression="UDB_Gender"
                                HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="HT_Height" HeaderText="Height" SortExpression="HT_Height"
                                ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                            <asp:BoundField DataField="HT_Weight" HeaderText="Weight" SortExpression="HT_Weight"
                                ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                            <asp:BoundField DataField="HT_HeartRate" HeaderText="Heart Rate" SortExpression="HT_HeartRate"
                                HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                            <asp:BoundField DataField="HT_SugarLevel" HeaderText="Sugar Level" SortExpression="HT_SugarLevel"
                                HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                            <asp:BoundField DataField="HT_Cholestrol" HeaderText="Cholestrol" SortExpression="HT_Cholestrol"
                                HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="HT_Platelet" HeaderText="Platelet" SortExpression="HT_Platelet"
                                HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
                <asp:Panel ID="MealPanel" Visible="false" runat="server">
                    <asp:GridView ID="gvSetMeal" runat="server" CssClass="table table-bordered table-hover"
                        EmptyDataText="There are no meal plans to display yet." AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="UDB_Id" HeaderText="User ID" ReadOnly="True" SortExpression="UDB_Id" />
                            <asp:BoundField DataField="UDB_Name" HeaderText="User Name" SortExpression="UDB_Name"
                                HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="HT_Age" HeaderText="User Age" SortExpression="HT_Age"
                                ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="UDB_Gender" HeaderText="Gender" SortExpression="UDB_Gender"
                                HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="MP_Monday" HeaderText="Monday" SortExpression="MP_Monday"
                                ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                            <asp:BoundField DataField="MP_Tuesday" HeaderText="Tuesday" SortExpression="MP_Tuesday"
                                ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                            <asp:BoundField DataField="MP_Wednesday" HeaderText="Wednesday" SortExpression="MP_Wednesday"
                                HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                            <asp:BoundField DataField="MP_Thursday" HeaderText="Thursday" SortExpression="MP_Thursday"
                                HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                            <asp:BoundField DataField="MP_Friday" HeaderText="Friday" SortExpression="MP_Friday"
                                HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="MP_Saturday" HeaderText="Saturday" SortExpression="MP_Saturday"
                                HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
                <asp:Panel ID="ExcercisePanel" runat="server">
                    <asp:GridView ID="gvExcercise" runat="server" AutoGenerateColumns="False" DataKeyNames="UDB_Id"
                        CssClass="table table-bordered table-hover" AutoGenerateSelectButton="True" EmptyDataText="There are no excercise plans to display yet."
                        OnSelectedIndexChanged="gvExcercise_SelectedIndexChanged">
                        <SelectedRowStyle BackColor="#D9D9D9" Font-Bold="True" ForeColor="Black" />
                        <Columns>
                            <asp:BoundField DataField="UDB_Id" HeaderText="User ID" ReadOnly="True" SortExpression="UDB_Id" />
                            <asp:BoundField DataField="UDB_Name" HeaderText="User Name" SortExpression="UDB_Name"
                                HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="HT_Age" HeaderText="User Age" SortExpression="HT_Age"
                                ItemStyle-CssClass="visible-lg" HeaderStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="UDB_Gender" HeaderText="Gender" SortExpression="UDB_Gender"
                                HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="Ex_Pushups" HeaderText="Pushups" SortExpression="Ex_Pushups"
                                ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                            <asp:BoundField DataField="Ex_JumpJacks" HeaderText="Jumping Jacks" SortExpression="Ex_JumpJacks"
                                ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                            <asp:BoundField DataField="Ex_DeclPushups" HeaderText="Decline Pushups" SortExpression="Ex_DeclPushups"
                                HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                            <asp:BoundField DataField="Ex_DiamondPushups" HeaderText="Diamond Pushups" SortExpression="Ex_DiamondPushups"
                                HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                            <asp:BoundField DataField="Ex_WideArmPushups" HeaderText="Wide Arm Pushups" SortExpression="Ex_WideArmPushups"
                                HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="Ex_CobraStrech" HeaderText="Cobra Strech" SortExpression="Ex_CobraStrech"
                                HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="Ex_ChestStrech" HeaderText="Chest Strech" SortExpression="Ex_ChestStrech"
                                HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="Ex_Yoga" HeaderText="Yoga" SortExpression="Ex_Yoga" HeaderStyle-CssClass="visible-lg"
                                ItemStyle-CssClass="visible-lg" />
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </div>
            <div class="col">
                <asp:Panel ID="setExPanel" runat="server" Visible="true">
                    <div class="row mb-2 text-center border-0">
                        <div class="col">
                            <asp:Label ID="lblSelUsr" runat="server" Text="ID"></asp:Label>
                        </div>
                        <div class="col">
                            <asp:Label ID="lblSelName" runat="server" Text="Name"></asp:Label>
                        </div>
                    </div>
                    <div class="card box-shadow">
                        <div class="card-body">
                            <div class="form-group row">
                                <label class="col-sm col-form-label">
                                    Push Ups
                                </label>
                                <div class="col-sm-5">
                                    <asp:TextBox ID="txtPUps" runat="server" Style="text-align: center;" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="txtPUpsVal" runat="server" ErrorMessage="Required"
                                        Style="font-weight: normal; font-size: small; color: Red;" 
                                        ValidationGroup="valGpOne" ControlToValidate="txtPUps"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="txtPUpsRVal" ControlToValidate="txtPUps" runat="server"
                                        ErrorMessage="Numbers only!" ValidationGroup="valGpOne" Style="font-weight: normal;
                                        font-size: small; color: Red;" Display="Dynamic" ValidationExpression="\d+">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <label class="col-sm-3 col-form-label">
                                    reps</label>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm col-form-label">
                                    Jumping Jacks</label>
                                <div class="col-sm-5">
                                    <asp:TextBox ID="txtJJ" runat="server" Style="text-align: center;" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="txtJJVal" runat="server" ErrorMessage="Required"
                                        Style="font-weight: normal; font-size: small; color: Red;" ValidationGroup="valGpOne"
                                        ControlToValidate="txtJJ"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="txtJJRVal" Display="Dynamic" ControlToValidate="txtJJ" runat="server"
                                        ErrorMessage="Numbers only!" ValidationGroup="valGpOne" Style="font-weight: normal;
                                        font-size: small; color: Red;" ValidationExpression="\d+">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <label class="col-sm-3 col-form-label">
                                    reps</label>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm col-form-label">
                                    Decline Pushups</label>
                                <div class="col-sm-5">
                                    <asp:TextBox ID="txtDePUps" runat="server" Style="text-align: center;" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="txtDePUpsVal" runat="server" ErrorMessage="Required"
                                        Style="font-weight: normal; font-size: small; color: Red;" ValidationGroup="valGpOne"
                                        ControlToValidate="txtDePUps"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="txtDePUpsRVal" ControlToValidate="txtDePUps"
                                        runat="server" ErrorMessage="Numbers only!" ValidationGroup="valGpOne"
                                        Style="font-weight: normal; font-size: small; color: Red;" Display="Dynamic"
                                        ValidationExpression="\d+">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <label class="col-sm-3 col-form-label">
                                    reps</label>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm col-form-label">
                                    Diamond Pushups</label>
                                <div class="col-sm-5">
                                    <asp:TextBox ID="txtDiPUps" runat="server" Style="text-align: center;" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="txtDiPUpsVal" runat="server" ErrorMessage="Required"
                                        Style="font-weight: normal; font-size: small; color: Red;" ValidationGroup="valGpOne"
                                        ControlToValidate="txtDiPUps"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="txtDiPUpsRVal" ControlToValidate="txtDiPUps"
                                        runat="server" ErrorMessage="Numbers only!" ValidationGroup="valGpOne"
                                        Style="font-weight: normal; font-size: small; color: Red;" Display="Dynamic"
                                        ValidationExpression="\d+">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <label class="col-sm-3 col-form-label">
                                    reps</label>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm col-form-label">
                                    Wide Arm Pushups</label>
                                <div class="col-sm-5">
                                    <asp:TextBox ID="txtWAPUps" runat="server" Style="text-align: center;" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="txtWAPUpsVal" runat="server" ErrorMessage="Required"
                                        Style="font-weight: normal; font-size: small; color: Red;" ValidationGroup="valGpOne"
                                        ControlToValidate="txtWAPUps"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="txtWAPUpsRVal" ControlToValidate="txtWAPUps"
                                        runat="server" ErrorMessage="Numbers only!" ValidationGroup="valGpOne"
                                        Style="font-weight: normal; font-size: small; color: Red;" Display="Dynamic"
                                        ValidationExpression="\d+">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <label class="col-sm-3 col-form-label">
                                    reps</label>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm col-form-label">
                                    Cobra Stretch</label>
                                <div class="col-sm-5">
                                    <asp:TextBox ID="txtCobraStrch" runat="server" Style="text-align: center;" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="txtCobraStrchVal" runat="server"
                                        ErrorMessage="Required" Style="font-weight: normal; font-size: small; color: Red;"
                                        ValidationGroup="valGpOne" ControlToValidate="txtCobraStrch"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="txtCobraStrchRVal" ControlToValidate="txtCobraStrch"
                                        runat="server" ErrorMessage="Numbers only!" ValidationGroup="valGpOne"
                                        Style="font-weight: normal; font-size: small; color: Red;" Display="Dynamic"
                                        ValidationExpression="\d+">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <label class="col-sm-3 col-form-label">
                                    mins</label>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm col-form-label">
                                    Chest Stretch</label>
                                <div class="col-sm-5">
                                    <asp:TextBox ID="txtChstStrch" runat="server" Style="text-align: center;" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="txtChstStrchVal" runat="server"
                                        ErrorMessage="Required" Style="font-weight: normal; font-size: small; color: Red;"
                                        ValidationGroup="valGpOne" ControlToValidate="txtChstStrch"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="txtChstStrchRVal" ControlToValidate="txtChstStrch"
                                        runat="server" ErrorMessage="Numbers only!" ValidationGroup="valGpOne"
                                        Style="font-weight: normal; font-size: small; color: Red;" Display="Dynamic"
                                        ValidationExpression="\d+">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <label class="col-sm-3 col-form-label">
                                    mins</label>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm col-form-label">
                                    Yoga</label>
                                <div class="col-sm-5">
                                    <asp:TextBox ID="txtYoga" runat="server" Style="text-align: center;" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="txtYogaVal" runat="server" ErrorMessage="Required"
                                        Style="font-weight: normal; font-size: small; color: Red;" ValidationGroup="valGpOne"
                                        ControlToValidate="txtYoga"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="txtYogaRVal" ControlToValidate="txtYoga" runat="server"
                                        ErrorMessage="Only Numbers allowed!" ValidationGroup="valGpOne" Style="font-weight: normal;
                                        font-size: small; color: Red;" Display="Dynamic" ValidationExpression="\d+">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <label class="col-sm-3 col-form-label">
                                    mins</label>
                            </div>
                            <div class="form-group row">
                                <div class="col">
                                    <asp:Button ID="btnSetEx" runat="server" class="btn btn-outline-primary form-control fs-normal"
                                        Text="Set Excercise" OnClick="btnSetEx_Click" ValidationGroup="valGpOne" />
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
