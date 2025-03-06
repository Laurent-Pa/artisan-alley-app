import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="order"
export default class extends Controller {
  static targets = ["total", "quantity", "price", "hiddenTotal"]
  connect() {
    console.log("Je suis connecté")
    console.log(this.totalTarget)

  }
  calculatTotal() {
    const quantity = this.quantityTarget.value;
    const price = this.priceTarget.dataset.price;
    const total = quantity * price;
    this.totalTarget.textContent = total.toFixed(2);
    this.hiddenTotalTarget.value = this.totalTarget.textContent
  }
}
