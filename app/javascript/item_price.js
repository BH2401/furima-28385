window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const Result  = document.getElementById("profit");


  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    const Tax = Math.floor(inputValue * 0.1)
    Result.innerHTML = Math.floor(inputValue - Tax)
  })
})