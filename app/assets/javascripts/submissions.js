var submission = (function($) {

  var init = function() {
    //initSelectOnlyAttender();
    initToggleStates();
    initRequirementToggle();
  };

  /* private */

  var initSelectOnlyAttender = function() {
    $('#submission_presentation_type_attender').click();
  };

  var initRequirementToggle = function() {
    $('input[name="submission[presentation_type]"]').change(function() {
      initToggleStates();
    });
  };

  var initToggleStates = function() {
    if ($('#submission_presentation_type_attender').is(':checked')) {
      $('.togglable').removeClass('required');
      $('.togglable').prop('readonly', true);
    } else {
      $('.togglable').addClass('required');
      $('.togglable').prop('readonly', false);
    }
  };

  return { init: init };
})(jQuery, window, document);
