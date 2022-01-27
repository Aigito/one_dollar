const goalsuggestor = (() => {
  const suggestions = [
      "Down payment for a horse, yes...a horse",
      "Le Wagon Coding Bootcamp"
    ]

  let currentSuggestion = ""
  let previousSuggestion = ""

  const randomizer = (() => {
    currentSuggestion = suggestions[Math.floor(Math.random() * suggestions.length)]
  });

  const button = document.querySelector('.goal-suggestion-button')
  const modaltext = document.querySelector('.modal-body')

  if (button) {
    button.addEventListener('click', function(){
      while (currentSuggestion == previousSuggestion ) {
        randomizer();
      };

      previousSuggestion = currentSuggestion
      modaltext.innerHTML = currentSuggestion
    });
  }
});

export { goalsuggestor };
