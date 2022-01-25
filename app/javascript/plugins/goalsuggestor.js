const goalsuggestor= (() => {
  const suggestions = [
      "Give to charity",
      "Build up emergency fund",
      "Backpacking trip",
      "New pair of running shoes",
      "Hire a clown",
      "Nice bottle of wine",
      "Gift to a friend",
      "Retirement!!!",
      "Down payment for a horse, yes...a horse",
      "Le Wagon Coding Bootcamp",
      "Index Fund / EFTs",
      "Gym Equipment"
    ]

  let currentSuggestion = ""
  let previousSuggestion = ""

  const randomizer = (() => {
    currentSuggestion = suggestions[Math.floor(Math.random() * suggestions.length)]
  });

  const button = document.querySelector('.goal-suggestion-button')
  const modaltext = document.querySelector('.modal-body')

  button.addEventListener('click', function(){
    while (currentSuggestion == previousSuggestion ) {
      randomizer();
    };

    previousSuggestion = currentSuggestion
    modaltext.innerHTML = currentSuggestion
  });
});

export { goalsuggestor };
