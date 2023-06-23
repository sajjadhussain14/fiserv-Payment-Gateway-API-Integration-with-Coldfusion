<cfcomponent name="payment">
	<cfscript>
		// CREATE OBJECTS
		app = createObject("component","config");
        oauthObj = createObject("component","oauth");
</cfscript>
	<!------- CHARGE A PAYMENT------->
    <cffunction name="processPayment" access="remote" returnFormat="plain">
		<cfargument name="requestBody" type="any" required="false" />
		<cfscript>
			requestMethod = "POST";
			requestBody=arguments.requestBody
			//requestBody=serializeJSON(arguments.requestBody)
			// DO HMAC HASHING TO GENERATE CRYTOGRAPHIC DATA & AUTHORIZATION AND TOKENS
			computedHmac=oauthObj.genHashEncodedAuthorization(requestBody,app)
			// API ENDPINT
			endpoint=app.apiEndPoint&"payments/v1/charges"
			// API REQUEST
			order={}
			cfhttp(method=requestMethod, url=endpoint, result="result" , charset = "utf-8") {
				cfhttpparam(type="header", name="Content-Type", value="application/json")
				cfhttpparam(type="header", name="Client-Request-Id", value=app.clientRequestId)
				cfhttpparam(type="header", name="Api-Key", value=app.apiKey)
				cfhttpparam(type="header", name="Timestamp", value=app.timestamp)
				cfhttpparam(type="header", name="Auth-Token-Type", value=app.authTokenType)
				cfhttpparam(type="header", name="Authorization", value=computedHmac)
				cfhttpparam(type="body",  value=requestBody)
			}
			return result.fileContent;
		</cfscript>
    </cffunction>  
	<!------- CANCEL ORDER------->
    <cffunction name="cancelOrder" access="remote" returnFormat="plain">
		<cfargument name="requestBody" type="any" required="false" />
		<cfscript>
			requestMethod = "POST";
			requestBody=arguments.requestBody
			//requestBody=serializeJSON(arguments.requestBody)
			// DO HMAC HASHING TO GENERATE CRYTOGRAPHIC DATA & AUTHORIZATION AND TOKENS
			computedHmac=oauthObj.genHashEncodedAuthorization(requestBody,app)
			// API ENDPINT
			endpoint=app.apiEndPoint&"payments/v1/cancels"
			// API REQUEST
			order={}
			cfhttp(method=requestMethod, url=endpoint, result="result" , charset = "utf-8") {
				cfhttpparam(type="header", name="Content-Type", value="application/json")
				cfhttpparam(type="header", name="Client-Request-Id", value=app.clientRequestId)
				cfhttpparam(type="header", name="Api-Key", value=app.apiKey)
				cfhttpparam(type="header", name="Timestamp", value=app.timestamp)
				cfhttpparam(type="header", name="Auth-Token-Type", value=app.authTokenType)
				cfhttpparam(type="header", name="Authorization", value=computedHmac)
				cfhttpparam(type="body",  value=requestBody)
			}
			return result.fileContent;
		</cfscript>
    </cffunction>
	<!------- CANCEL ORDER------->
    <cffunction name="refundOrder" access="remote" returnFormat="plain">
		<cfargument name="requestBody" type="any" required="false" />
		<cfscript>
			requestMethod = "POST";
			requestBody=arguments.requestBody
			//requestBody=serializeJSON(arguments.requestBody)
			// DO HMAC HASHING TO GENERATE CRYTOGRAPHIC DATA & AUTHORIZATION AND TOKENS
			computedHmac=oauthObj.genHashEncodedAuthorization(requestBody,app)
			// API ENDPINT
			endpoint=app.apiEndPoint&"payments/v1/cancels"
			// API REQUEST
			order={}
			cfhttp(method=requestMethod, url=endpoint, result="result" , charset = "utf-8") {
				cfhttpparam(type="header", name="Content-Type", value="application/json")
				cfhttpparam(type="header", name="Client-Request-Id", value=app.clientRequestId)
				cfhttpparam(type="header", name="Api-Key", value=app.apiKey)
				cfhttpparam(type="header", name="Timestamp", value=app.timestamp)
				cfhttpparam(type="header", name="Auth-Token-Type", value=app.authTokenType)
				cfhttpparam(type="header", name="Authorization", value=computedHmac)
				cfhttpparam(type="body",  value=requestBody)
			}
			return result.fileContent;
		</cfscript>
    </cffunction>
</cfcomponent>