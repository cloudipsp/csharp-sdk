﻿<%@ Page Async="true" Language="C#" AutoEventWireup="true" CodeBehind="p2pcredit.aspx.cs" Inherits="CloudIpspSamples.P2pCreditSample" %>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<head runat="server">
    <title>P2pcredit Order</title>
</head>
<body>
<div class="container">
    <% if (ResponeData != null)
       { %>
        <% if (ResponeOrderError != null)
           { %>
            <h2>Signature Error</h2>
            <table class="table table-sm">
                <tr>
                    <td>Calculated Signature</td>
                    <td><% Response.Write(ResponeOrderCalculatedSignatureString); %></td>
                </tr>
                <tr>
                    <td>Response Signature</td>
                    <td><% Response.Write(ResponeOrderSignatureString); %></td>
                </tr>
            </table>
        <% }
           else
           { %>
            <h2>Order p2p responce</h2>
            <table class="table table-sm">
                <tr>
                    <td>Status</td>
                    <td><% Response.Write(P2PResp.order_status); %></td>
                </tr>
                <tr>
                    <td>Amount (in cents)</td>
                    <td><% Response.Write(P2PResp.amount); %></td>
                </tr>
                <tr>
                    <td>Response description</td>
                    <td><% Response.Write(P2PResp.response_description); %></td>
                </tr>
                <tr>
                    <td>Order Id</td>
                    <td><% Response.Write(P2PResp.order_id); %></td>
                </tr>
                <tr>
                     <td>Additional Data</td>
                     <td><% Response.Write(P2PResp.additional_info); %></td>
                 </tr>
            </table>
            <h2>Order Response data</h2>
            <table class="table table-sm">
                <% foreach (string k in ResponeData)
                   { %>
                    <tr>
                        <td><% Response.Write(k); %></td>
                        <td><% Response.Write(ResponeData[k]); %></td>
                    </tr>
                <% } %>
            </table>
    <% }
       }
       else if (DataError != null)
       { %>
        <h2>Error!<br/>Request ID: <b><% Response.Write(Data); %></b></h2>
        <h5>Error message: <b><% Response.Write(DataError); %></b></h5>
    <% }
       else
       { %>
        <form runat="server">
            <fieldset>
                <legend>Generate Order to get card token</legend>
                <legend>Returns from checkout on this page</legend>
                <div class="form-group">
                    <label for="order_id">Order ID: </label>
                    <input id="order_id" class="form-control" type="text" name="order_id" value="<%
                                                                                                     if (Request.Form["order_id"] == null)
                                                                                                     {
                                                                                                         Response.Write(Guid.NewGuid().ToString());
                                                                                                     }
                                                                                                     else
                                                                                                     {
                                                                                                         Response.Write(Request.Form["order_id"]);
                                                                                                     }
                                                                                                 %>"/>

                </div>
                <div class="form-group">
                    <label for="amount">Amount:</label>
                    <input id="amount" class="form-control" type="number" name="amount" value="<%
                                                                                                   if (Request.Form["amount"] == null)
                                                                                                   {
                                                                                                       Response.Write("100");
                                                                                                   }
                                                                                                   else
                                                                                                   {
                                                                                                       Response.Write(Request.Form["amount"]);
                                                                                                   }
                                                                                               %>"/>
                </div>
                <div class="form-group">
                                    <label for="reservation_data">Reservation Data:</label>
                                    <input id="reservation_data" class="form-control" type="text" name="reservation_data" value="<%
                                                                                                                   if (Request.Form["reservation_data"] == null)
                                                                                                                   {
                                                                                                                       Response.Write("eyJyZWNlaXZlcl9pbm4iOiAxMDAwfQ==");
                                                                                                                   }
                                                                                                                   else
                                                                                                                   {
                                                                                                                       Response.Write(Request.Form["reservation_data"]);
                                                                                                                   }
                                                                                                               %>"/>
                                </div>
            </fieldset>
            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" Text="Submit" runat="server"/>
        </form>
    <% } %>
</div>
</body>
</html>