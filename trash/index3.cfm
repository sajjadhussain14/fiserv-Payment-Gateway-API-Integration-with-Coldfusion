<cfoutput>
	<cfinclude template = "./includes/header.cfm">
		<cfscript>
		// create objects 
		app = createObject("component","src.components.config");
		oauthObj = createObject("component","src.components.oauth");
		paymentObj = createObject("component","src.components.payment");
		// Check Pay Now Button is Clicked
		payload = {"amount":{"total":12.04,"currency":"USD"},"source":{"sourceType":"PaymentCard","card":{"cardData":"5413330089010640","expirationMonth":"10","expirationYear":"2023"}},"transactionDetails":{"captureFlag":true,"merchantInvoiceNumber":"123456789012"},"transactionInteraction":{"origin":"ECOM","eciIndicator":"CHANNEL_ENCRYPTED","posConditionCode":"CARD_NOT_PRESENT_ECOM"},"merchantDetails":{"terminalId":toString(app.terminalId),"merchantId":toString(app.merchantId)}};
		writeDump("check Out Details")
		writeDump(payload)
		if(structKeyExists(form, "commerHub"))
		{
			// IT IS REQUIRED FOR IFRAME METHOD
			creds=oauthObj.getCredentials()
			// FOR SERVER SIDE
			orderData=paymentObj.processPayment(payload)
			writeDump(orderData)
		}
		else{
		}
		</cfscript>

	  <div class="row">
	  	<div class="col-12">
		<form name="myForm" action="" method="post">
			<input type="submit" value="Pay Now" name="commerHub" class="btn bg-primary text-light p-2 m-5">
		</form>
	     </div>
	   </div>

	<cfinclude template = "./includes/footer.cfm">
</cfoutput>
