<cfoutput>
	<cfinclude template = "./includes/header.cfm">
    <!-- START MAIN CONTAINER -->
    <div class="container-fluid ">
        <div class="row p-3 mt-2 w-100 border shadow-lg p-3 mb-5 bg-body rounded vh-100">
            <div class="col-12 w-100 text-center">
                <h3> Thank you for your Order</h3>
                <p> Your order details are given below </p>
                <hr />
                <div id="Order-Data">
                </div>
            </div>
        </div>
    </div>
    <script>
        let orderData ={}
        orderData = localStorage.getItem('orderDetail');
        console.log(orderData)
        document.getElementById("Order-Data").innerHTML=orderData
    </script>
	<cfinclude template = "./includes/footer.cfm">
</cfoutput>


