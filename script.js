const meals = [
    "Lemon herb roasted chicken with crispy potatoes and green beans.",
    "Garlic butter shrimp over creamy parmesan polenta.",
    "Smoky pulled pork tacos with lime slaw and avocado crema.",
    "Miso-glazed salmon with sesame snap peas and jasmine rice.",
    "Cajun sausage and bell pepper pasta with a light cream sauce.",
    "Chickpea tikka masala with basmati rice and warm naan.",
    "Balsamic steak tips with roasted carrots and mashed potatoes.",
    "Roasted vegetable gnocchi with brown butter and sage."
];

const ctaButton = document.getElementById('cta-btn');
const mealDialog = document.getElementById('meal-dialog');
const mealDialogText = document.getElementById('meal-dialog-text');

ctaButton.addEventListener('click', () => {
    const randomMeal = meals[Math.floor(Math.random() * meals.length)];
    mealDialogText.textContent = randomMeal;

    if (typeof mealDialog.showModal === 'function') {
        mealDialog.showModal();
        return;
    }

    alert(randomMeal);
});
