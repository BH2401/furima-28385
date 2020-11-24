const pay = () => {
  Payjp.setPublicKey("pk_test_e174bece763caecb102acff7");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      card_information: formData.get("item_purchase[card_information]"),
      month: formData.get("item_purchase[month]"),
      year: `20${formData.get("item_purchase[year]")}`,
      security_code: formData.get("item_purchase[security_code]")
    };
    console.log(card);
  })
}

window.addEventListener("load", pay);