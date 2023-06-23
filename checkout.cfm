<cfoutput>
	<cfinclude template = "./includes/header.cfm">
    <div id="spinner" class="loader d-none">
    </div>
    <cfscript>
    orderData={
            amount: {
            total: 12.04,
            currency: "USD"
            }}
    </cfscript>
    <!-- START MAIN CONTAINER -->
    <div class="container-fluid ">
        <div class="row p-5 mt-2 w-100 border shadow-lg p-3 mb-5 bg-body rounded vh-100">
            <div class="col-12 w-100 text-center">
                <h6>Order details</h6>
                <cfdump var = "#orderData#" >
                <h5> Place order with Fiserv</h5>
                <hr />
                <div id="payment-saq-a-form-div" class="payment-screen col-12"></div>
                <button type="button" id="fiserv-btn" onclick="getCredentialsRequest()" class="btn btn btn-primary m-2 p-2 bm-5"> Pay with Fiserv </button>
            </div>
        </div>
    </div>
    <cfinclude template = "./includes/footer.cfm">
</cfoutput>
