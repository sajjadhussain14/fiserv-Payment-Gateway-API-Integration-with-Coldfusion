// Fider V0.1 Author: Sajjad Hussain
const getCredentialsRequest = () => {
  initFiserv();
  // run loader
  runLoader();
  // get credentials settings
  let settings = {
    async: true,
    crossDomain: true,
    url: "src/components/oauth.cfc?method=getCredentials",
    method: "get",
  };
  // response of credentials request from Oauth.cfc
  $.ajax(settings).done(function (res) {
    // remove loader
    let credentials = {};
    // parse respose into json
    try {
      credentials = JSON.parse(res);
    } catch (err) {
      credentials = {};
      console.log("Error in getting Credentisla is ", err);
    }
    // payload of Transaction
    let payLoad = {
      amount: {
        total: 12.04,
        currency: "USD",
      },
      source: {
        sourceType: "PaymentSession",
        sessionId: credentials.sessionId,
      },
      transactionDetails: {
        captureFlag: true,
        merchantInvoiceNumber: "123456789012",
      },
      merchantDetails: {
        merchantId: credentials.merchantId,
        terminalId: credentials.terminalId,
      },
    };
    // create form and assign param to commercehub to loader Payment screen
    const authorization = credentials.accessToken;
    const apiKey = credentials.apiKey;
    const formConfig = credentials;
    const form = new commercehub.Fiserv(formConfig, authorization, apiKey);
    // load payment screen
    form
      .loadPaymentForm("payment-saq-a-form-div")
      .then((next) => {
        // Now process payment charges after Card Captured Sucessfully
        processPaymentChargesRequest(payLoad);
      })
      .catch((error) => {
        console.log("Failed Payment Charges processing");
        console.log(error);
      });
    setTimeout(() => {
      hidePayButton();
      stopLoader();
    }, 3000);
  });
};
// process payment changes request
const processPaymentChargesRequest = (payLoad) => {
  runLoader();
  // payment processing settings
  let settings = {
    async: true,
    crossDomain: true,
    url: "src/components/payment.cfc?method=processPayment",
    method: "POST",
    data: {
      requestBody: JSON.stringify(payLoad),
    },
  };
  // respose of payment processing from payment.cfc
  $.ajax(settings).done(function (res) {
    let order = {};
    try {
      order = JSON.parse(res);
    } catch (err) {
      console.log("Error payment Processing", err);
    }
    localStorage.setItem("orderDetail", JSON.stringify(order));
    window.location.href = "/fiserv/thank-you.cfm";
  });
};
const runLoader = () => {
  try {
    document.getElementById("spinner").classList.remove("d-none");
  } catch (err) {}
};
const stopLoader = () => {
  try {
    document.getElementById("spinner").classList.add("d-none");
  } catch (err) {}
};
const initFiserv = () => {
  try {
    document.getElementById("fiserv-btn").style.display = "block";
  } catch (err) {}
};
const hidePayButton = () => {
  try {
    document.getElementById("fiserv-btn").style.display = "none";
  } catch (err) {}
};
const hidePaymentScreen = () => {
  try {
    // document.getElementById("payment-saq-a-form-div").style.display = "none";
  } catch (err) {}
};
// cancel order request
const cancelOrderRequest = () => {
  // run loader
  runLoader();
  // get form values
  let referenceTransactionId = document.getElementById(
    "referenceTransactionId"
  ).value;
  let referenceTransactionType = document.getElementById(
    "referenceTransactionType"
  ).value;
  let amount = document.getElementById("amount").value;
  const orderAmount = parseInt(amount, 10);

  let merchantInvoiceNumber = document.getElementById(
    "merchantInvoiceNumber"
  ).value;
  let terminalId = document.getElementById("terminalId").value;
  let merchantId = document.getElementById("merchantId").value;
  //construct payload
  let payload = {
    referenceTransactionDetails: {
      referenceTransactionId: referenceTransactionId,
      referenceTransactionType: referenceTransactionType,
    },
    amount: { total: orderAmount, currency: "USD" },
    transactionDetails: { merchantInvoiceNumber: merchantInvoiceNumber },
    merchantDetails: { terminalId: terminalId, merchantId: merchantId },
  };
  // payment processing settings
  let settings = {
    async: true,
    crossDomain: true,
    url: "src/components/payment.cfc?method=cancelOrder",
    method: "POST",
    data: {
      requestBody: JSON.stringify(payload),
    },
  };
  // respose of payment processing from payment.cfc
  $.ajax(settings).done(function (res) {
    let dataPlaceholder = document.getElementById("cancel-order-res");
    try {
      dataPlaceholder.classList.remove("d-none");
    } catch (err) {}
    dataPlaceholder.innerHTML = res;
    stopLoader();
  });
};
const refundOrderRequest = () => {
  // run loader
  runLoader();
  // get form values
  let referenceMerchantTransactionId = document.getElementById(
    "referenceMerchantTransactionId"
  ).value;
  let referenceTransactionType = document.getElementById(
    "referenceTransactionType"
  ).value;
  let amount = document.getElementById("amount").value;
  const orderAmount = parseInt(amount, 10);
  let merchantInvoiceNumber = document.getElementById(
    "merchantInvoiceNumber"
  ).value;
  let terminalId = document.getElementById("terminalId").value;
  let merchantId = document.getElementById("merchantId").value;
  // constuct payload
  let payload = {
    referenceTransactionDetails: {
      referenceMerchantTransactionId: referenceMerchantTransactionId,
      referenceTransactionType: referenceTransactionType,
    },
    amount: { total: orderAmount, currency: "USD" },
    transactionDetails: { merchantInvoiceNumber: merchantInvoiceNumber },
    merchantDetails: { terminalId: terminalId, merchantId: merchantId },
  };
  // payment processing settings
  let settings = {
    async: true,
    crossDomain: true,
    url: "src/components/payment.cfc?method=refundOrder",
    method: "POST",
    data: {
      requestBody: JSON.stringify(payload),
    },
  };
  // respose of payment processing from payment.cfc
  $.ajax(settings).done(function (res) {
    let dataPlaceholder = document.getElementById("refund-order-res");
    try {
      dataPlaceholder.classList.remove("d-none");
    } catch (err) {}
    dataPlaceholder.innerHTML = res;
    stopLoader();
  });
};
