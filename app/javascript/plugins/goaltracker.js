const goaltracker = (() => {
  const plusButton = document.querySelector('.plus-button')
  const amount = document.querySelector('.goal-amount-tracked')

  if (plusButton) {
    plusButton.addEventListener('click', function(){
      console.log(amount.value)
    });
  }
})

export { goaltracker }
