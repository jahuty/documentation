/**
 * Toggles properties of language-specific elements.
 *
 * This script uses two data-* attributes to toggle the visibility, activity, or
 * value of language-specific code blocks, links, etc:
 *
 *   data-toggle-language  (string)  the element's language (possible values
 *     include "php", "ruby", "bash", and "javascript"; "true" is also a
 *     possible value but it's used to indicate participation within limits)
 *
 *   data-toggle-type  (string)  the element's type of toggling (possible values
 *     include "activity" [e.g., nav link], "visibility" [e.g., a code block],
 *     and "value" [e.g., a select element])
 */
(function () {
  function getLanguage() {
    return localStorage.getItem('jahuty:language') || 'bash';
  }

  function setLanguage(language) {
    localStorage.setItem('jahuty:language', language);
  }

  function toggleLanguage(language) {
    toggleActivity(language);
    toggleVisibility(language);
    toggleValue(language);
  }

  function toggleActivity(language) {
    document
      .querySelectorAll('[data-toggle-type="activity"]')
      .forEach((element) => {
        element.classList.remove('active');
      });

    const selector =
      '[data-toggle-type="activity"]' +
      '[data-toggle-language="' + language + '"]';
    document
      .querySelectorAll(selector)
      .forEach((element) => {
        element.classList.add('active');
      });
  }

  function toggleVisibility(language) {
    document
      .querySelectorAll('[data-toggle-type="visibility"]')
      .forEach((element) => {
        element.style.display = 'none';
      });

    const selector =
      '[data-toggle-type="visibility"]' +
      '[data-toggle-language="' + language + '"]';
    document
      .querySelectorAll(selector).forEach((element) => {
        element.style.display = 'block';
      });
  }

  function toggleValue(language) {
    document
      .querySelectorAll('[data-toggle-type="value"]')
      .forEach((element) => {
        element.value = language;
      });
 }

  // initialize on load
  document.addEventListener('DOMContentLoaded', () => {
    let language = getLanguage();

    toggleLanguage(language);
    setLanguage(language);
  });

  // toggle on element click
  document.addEventListener('click', (e) => {
    if (e.target.hasAttribute('data-toggle-language')) {
      const language = e.target.getAttribute('data-toggle-language');

      if (language !== 'true') {
        toggleLanguage(language);
        setLanguage(language);

        e.preventDefault();
      }
    }
  });

  // toggle on select element change
  document.addEventListener('change', (e) => {
    if (e.target.hasAttribute('data-toggle-language')) {
      const language = e.target.value;

      toggleLanguage(language);
      setLanguage(language);
    }
  });
}());
