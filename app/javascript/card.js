const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("item_purchase[card_information]"),
      exp_month: formData.get("item_purchase[month]"),
      exp_year: `20${formData.get("item_purchase[year]")}`,
      cvc: formData.get("item_purchase[security_code]")
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name", "item_purchase[card_information]");
      document.getElementById("card-exp-month").removeAttribute("name", "item_purchase[month]");
      document.getElementById("card-exp-year").removeAttribute("name", "item_purchase[year]");
      document.getElementById("card-cvc").removeAttribute("name", "item_purchase[security_code]");

      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    })
  })
}

window.addEventListener("load", pay);