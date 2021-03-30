function count (){
  const itemPrice = document.getElementById('item-price')
  itemPrice.addEventListener("keyup", () => {
    const taxPrice = itemPrice.value * 0.1
    const addTaxPrice = document.getElementById('add-tax-price')
      addTaxPrice.innerHTML = taxPrice
    const profit = document.getElementById('profit')
      profit.innerHTML = itemPrice.value - taxPrice
  });
};

window.addEventListener('load', count);