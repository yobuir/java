<script src="https://checkout.flutterwave.com/v3.js"></script>
 
<script>
   
  function makePayment() {
    FlutterwaveCheckout({
      public_key: "FLWPUBK_TEST-65b546c1a25a2d37c10cebf6f2f3bd3d-X",
      tx_ref: "titanic-48981487343MDI0NzMx",
      amount: 150,
      currency: "NGN",
      payment_options: "card, banktransfer, ussd",
      redirect_url: "http://localhost:8090/wallett/depost.jsp",
      meta: {
        consumer_id: 23,
        consumer_mac: "92a3-912ba-1192a",
      },
      customer: {
        email: "yobu@gmail.com",
        phone_number: "0780809031",
        name: "Iradukunda Yobu",
      },
      customizations: {
        title: "Wallet",
        description: "deposit",
        logo: "https://www.logolynx.com/images/logolynx/22/2239ca38f5505fbfce7e55bbc0604386.jpeg",
      },
    });
  }
   makePayment();
</script>