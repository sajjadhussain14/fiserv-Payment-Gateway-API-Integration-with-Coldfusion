<cfoutput>
	<cfinclude template = "./includes/header.cfm">
    <div id="spinner" class="loader d-none">
    </div>
    <!-- START MAIN CONTAINER -->
    <div class="container-fluid ">
        <div class="row p-3 mt-2 w-100 border shadow-lg p-3 mb-5 bg-body rounded vh-100">
            <div class="col-12 w-100 text-center"><h5> Cancel Order</h5>
                <hr />
            </div>
            <div class="input-group mb-3">
                <div class="col-6"> referenceTransactionId </div> 
                <div class="col-6"> <input id="referenceTransactionId" type="text" /> </div> 
                </div>
            <div class="input-group mb-3">
                <div class="col-6"> referenceTransactionType </div> 
                <div class="col-6 "> <input id="referenceTransactionType" class="" type="text"  value="CHARGES" /> </div> 
            </div>
            <div class="input-group mb-3">
                <div class="col-6"> amount </div> 
                <div class="col-6"> <input id="amount" type="text" /> </div> 
            </div>
            <div class="input-group mb-3">
                <div class="col-6"> merchantInvoiceNumber </div> 
                <div class="col-6"> <input id="merchantInvoiceNumber" type="text" /> </div>
            </div>
            <div class="input-group mb-3">
                <div class="col-6"> terminalId </div> 
                <div class="col-6"> <input id="terminalId" type="text" /> </div>
            </div>
            <div class="input-group mb-3">
                <div class="col-6"> merchantId </div> 
                <div class="col-6"> <input id="merchantId" type="text" /> </div> 
            </div>
            <div id="cancel-order-res" class="alert alert-info d-none" role="alert">
                A simple info alert—check it out!
            </div>
            <div class="input-group mb-3">
                <div class="col-12 w-100 text-center mt-2" >
                    <button type="button" class="btn btn-secondary" onclick="cancelOrderRequest()">Cancel Order</button>
                </div>
            </div>
        </div>
    </div>
    <cfinclude template = "./includes/footer.cfm">
</cfoutput>
