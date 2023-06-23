<cfcomponent name="config">
	<cfscript>
		//APP Settings
		this.domain = application.domain;
		this.apiKey = application.apiKey;
		this.appSecret = application.appSecret;
		this.apiEndPoint = application.apiEndPoint;
		this.merchantId=application.merchantId;
		this.terminalId=application.terminalId;
		this.clientRequestId = createUUID();
		this.timestamp = getTickCount();
		this.AuthTokenType = "HMAC";
		this.hashAlorithm = "HMACSHA256";
		this.decoding = "hex";
		this.encoding = "base64";
	</cfscript>
</cfcomponent>