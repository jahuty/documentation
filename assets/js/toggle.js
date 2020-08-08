/**
 * I'll toggle elements that are programming language specific.
 *
 *   1. Add a data-language-specific="true" to any Prism-compliant pre > code
 *      pair or a data-language-specific="LANGUAGE" to any element.
 *   2. Add a data-toggle-language="LANGUAGE" to any nav element or select
 *      element.
 *
 * @see  views/application/code_snippet
 * @see  views/application/code_snippets
 * @see  views/application/language_select
 */
 (function () {
   function getCurrentLanguage()
   {
     return localStorage.getItem('jahuty:current-language');
   }

   function setCurrentLanguage(language)
   {
     localStorage.setItem('jahuty:current-language', language);
   }

   function toggleLanguage(language)
   {
     setCurrentLanguage(language);
     dispatchToggleLanguage(language);
   }

   function dispatchToggleLanguage(language)
   {
     document.dispatchEvent(
       new CustomEvent('jahuty:toggle-language', { detail: language })
     );
   }

   document.addEventListener('jahuty:toggle-language', (e) => {
     let lang = e.detail;

     // Hide any language-specific elements and deactivate any active elements.
     $('[data-language-specific]').hide();
     $('[data-toggle-language].active').removeClass('active');

     // Show the elements specific to the current language (with a data-
     //     attribute or with a Prism.js-compliant classnam) and activate
     //     any toggle elements.
     $('[data-language-specific="' + lang + '"], [data-language-specific="true"].language-'+ lang).show();
     $('[data-toggle-language="' + lang + '"]').addClass('active');

     // Finally, set the value of any language select elements.
     $('select[data-toggle-language]').val(lang);
   });

   // on load, default to bash language
   document.addEventListener('DOMContentLoaded', () => {
     toggleLanguage(getCurrentLanguage() || 'bash');
   });

   // listen for clicks on data-lang-nav elements
   document.addEventListener('click', (e) => {
     if (e.target.hasAttribute('data-toggle-language')) {
       toggleLanguage(e.target.getAttribute('data-toggle-language'));
       e.preventDefault();
     }
   });

   // listen for changes on data-lang-select elements
   document.addEventListener('change', (e) => {
     if (e.target.hasAttribute('data-toggle-language')) {
       toggleLanguage(e.target.value);
     }
   });
 }());
