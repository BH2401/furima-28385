const pay = () => {
  Payjp.setPublicKey("pk_test_e174bece763caecb102acff7");
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

      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    })
  })
}

window.addEventListener("load", pay);