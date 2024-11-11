function changeThinkerSelection() {
    var selectedThinker = document.getElementById('thinkerSelector').value;
    var sections = document.getElementsByClassName('section');
    for (var i = 0; i < sections.length; i++) {
        var section = sections[i];
        var significanceValue = parseFloat(section.getAttribute('data-' + selectedThinker)) || 0; // Default to 0 if NaN
        section.style.backgroundColor = getColorForSignificance(significanceValue);
    }
}

function getColorForSignificance(significance) {
    // Ensure significance is a number and within the range of 0 to 1
    var normalizedSignificance = Math.min(Math.max(significance, 0), 1);

    // Calculate blue intensity from 255 (light blue) to 50 (dark blue)
    var blueIntensity = Math.round(255 - (normalizedSignificance * 205)); // Use 205 range to keep it from going to black

    // Return the RGB color with full opacity, transitioning from light blue to dark blue
    return `rgb(0, 0, ${blueIntensity})`;
}
