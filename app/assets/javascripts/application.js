//= require jquery_ujs
//= require jquery-ui
//= require youtube
//= require albums
//= require photos
//= require feedbacks
//= require maps
//= require twitter

function incrementAd() {
  $.currentAd++;
  $.currentAd = $.currentAd % $.numberOfAds;
}

function adSelector() {
  return ".rotating-ad:nth-child(" + ($.currentAd + 1) + ")";
}

function showNextAd() {
  $(adSelector()).removeClass("visible");
  incrementAd();
  $(adSelector()).addClass("visible");
}

function showLightbox() {
  setTimeout('$("#lightbox-content").show()', 500);
  $("#lightbox").fadeIn(1000);
  window.location = "#lightbox";
}

function hideLightbox() {
  setTimeout('$("#lightbox-content").hide()', 200);
  $("#lightbox").fadeOut();
}

$(function() {
  // Rotating Ads
  if ($(".rotating-ad").length >= 1) {
    $.currentAd = -1;
    $.numberOfAds = $(".rotating-ad").length;
    showNextAd();
    setInterval(showNextAd, 3000);
  }

  $("#bar").click(function() {
    $("#slide-down").slideToggle(1000);
  });

  $("#lightbox-header").click(function() {
    hideLightbox();
  });

  $("#postings-hr").click(function() {
    $("#slide-down").slideToggle(1000);
  });

  $("#lightbox").click(function(event) {
    if (outsideLightboxContent(event.pageX, event.pageY))
      hideLightbox();
  });

  $(document).click(function(event) {
    if ($("#slide-down").css("display") != "none") {
      if (event.pageY > ($("#slide-down").position().top + $("#slide-down").outerHeight()))
        $("#slide-down").slideToggle(1000);
    }

    if ($("#feedback-form").css("display") != "none") {
      if ($(event.target).is("select")) return; // Fixes bug: certain platforms would pass the next condition if the user is clicking a dropdown.
      if (event.pageY < $("#feedback-form").position().top || event.pageX < $("#feedback-form").position().left)
        $("#feedback-form").fadeOut();
    }
  });

  $(".tabs").each(function() {
    $(this).tabs();
  });
});
