<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FISERVE Integration | Sajjad Hussain</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" href="https://www.celerant.com/wp-content/uploads/2019/02/cropped-Celerant_Favicon_512x512-32x32.png" sizes="32x32">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./src/css/fiserv.css">
    <script id="commercehub" src="https://cert.api.fiservapps.com/ch/sdk/v1/commercehub-client-sdk.js"></script>
</head>
<body>
    <cfoutput>
        <div class="container-fluid ">
            <header class="row">
                <nav class="navbar navbar-expand-lg navbar-light bg-light col-12">
                        <a class="navbar-brand border-end  p-2" href="#application.baseUrl#">Home</a>
                        <a class="navbar-brand border-end  p-2" href="#application.baseUrl#checkout.cfm">Checkout</a>
                        <a class="navbar-brand border-end  p-2" href="#application.baseUrl#cancel-order.cfm">Cancel Transaction</a>
                        <a class="navbar-brand border-end  p-2" href="#application.baseUrl#refund.cfm">Refund Order</a>
                </nav>
            </header>
    </cfoutput>
