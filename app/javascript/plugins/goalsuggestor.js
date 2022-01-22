const goalsuggestor = (() => {
  const suggestions = [
      "Give to charity",
      "Build up emergency fund",
      "Backpacking trip",
      "New pair of running shoes",
      "Hire a clown",
      "Nice bottle of wine",
      "Gift to a friend",
      "Retirement!!!",
      "Down payment for a horse",
      "Le Wagon Coding Bootcamp",
      "Index Fund / EFTs",
      "Gym Equipment"
    ]

  const randomizer = (() => {
    return suggestions[Math.floor(Math.random() * suggestions.length)]
  });

  const button = document.querySelector('.goal-suggestion-button')
  const modaltext = document.querySelector('.modal-body')

  button.addEventListener('click', function(){
    modaltext.innerHTML = randomizer()
  });
});

export { goalsuggestor };
