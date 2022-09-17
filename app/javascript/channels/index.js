// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

function calc (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('input', function(){
    const itemPriceValue = itemPrice.value
    const Tax = 0.1;
    const tax_fee = Math.floor(itemPriceValue * Tax);
    const profit = Math.floor(itemPriceValue - tax_fee);
    const taxArea = document.getElementById("add-tax-price");
    const profitArea = document.getElementById("profit");
    taxArea.innerHTML = tax_fee;
    profitArea.innerHTML = profit;
  })
}

window.addEventListener('load', calc)