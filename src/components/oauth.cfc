<cfcomponent name="oauth">
	<cfscript>
		// CREATE OBJECT
		app = createObject("component","config");
	</cfscript>
	<!------ GET CREDENTIALS FROM ENDPOINT------->
    <cffunction name="getCredentials" access="remote" returnFormat="json">
		<cfscript>
			credentials=''
			// REQUEST PARAMS
			requestMethod = "POST";
			requestBody = {"domains":[{"url":app.domain}],"merchantDetails":{"merchantId":toString(app.merchantId)}};
			requestBody=serializeJSON(requestBody)
			// DO HMAC HASHING TO GENERATE CRYTOGRAPHIC DATA & AUTHORIZATION AND TOKENS
			computedHmac=genHashEncodedAuthorization(requestBody,app)
			// API REQUEST
			cfhttp(method=requestMethod, url=app.apiEndPoint&"payments-vas/v1/security/credentials", result="result" , charset = "utf-8") {
				cfhttpparam(type="header", name="Content-Type", value="application/json")
				cfhttpparam(type="header", name="Client-Request-Id", value=app.clientRequestId)
				cfhttpparam(type="header", name="Api-Key", value=app.apiKey)
				cfhttpparam(type="header", name="Timestamp", value=app.timestamp)
				cfhttpparam(type="header", name="Auth-Token-Type", value=app.authTokenType)
				cfhttpparam(type="header", name="Authorization", value=computedHmac)
				cfhttpparam(type="body",  value=requestBody)
			}
			if(lcase(result.Statuscode)=="201 created")
			{
				credentials=result.fileContent
				credentials=deserializeJson(credentials)
				credentials.merchantId=toString(app.merchantId)
				credentials.apiKey=app.apiKey;
				credentials.terminalId=app.terminalId
			}
			else
			{
				credentials='{}'
			}
			credentials=serializeJSON(credentials)
			return deSerializeJson(credentials);
		</cfscript>
    </cffunction> 
	<!---HASHING OF DATA FOR CRYPTOGRAPHIC INFO & AUTHORIZATION AND TOKENS---->
	<cffunction name="genHashEncodedAuthorization" access="remote" returnFormat="plain">
		<cfargument name="requestBody" type="any" required="true" />
		<cfargument name="app" type="any" required="true" />
		<cfscript>
			apps=arguments.app
			// Concatenate the signature message data
			rawSignature = apps.apiKey & apps.clientRequestId & apps.timestamp & arguments.requestBody;
			// generate Hmac hashing Code
			computedHash =  HMAC( rawSignature, apps.appSecret, apps.hashAlorithm ) ;
			//Generate Base64 based Signature Encoding 
			computedHmac = binaryEncode( binaryDecode(computedHash, apps.decoding), apps.encoding );
			return computedHmac;
		</cfscript>
    </cffunction> 
</cfcomponent>