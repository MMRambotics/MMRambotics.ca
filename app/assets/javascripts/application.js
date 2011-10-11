//= require jquery
//= require jquery_ujs
//= require youtube
//= require albums

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

function hidePostings() {
  $("#slide-down").animate({ height: "0" }, 1000);
  setTimeout('$("#postings").hide()', 1000);
  $.visible = false;
}

$(function() {
  // Rotating Ads
  if ($(".rotating-ad").length >= 1) {
    $.currentAd = -1;
    $.numberOfAds = $(".rotating-ad").length;
    showNextAd();
    setInterval(showNextAd, 3000);
  }

  $.visible = false;
  $("#bar").click(function() {
    if ($.visible) {
      hidePostings();
    } else {
      $("#slide-down").animate({ height: "400" }, 2000);
      setTimeout('$("#postings").show()', 500);
      $.visible = true;
    }
  });

  $("#lightbox-header").click(function() {
    hideLightbox();
  });

  $("#postings-hr").click(function() {
    hidePostings();
  });

  $("#lightbox").click(function() {
    if (outsideLightboxContent(event.pageX, event.pageY))
      hideLightbox();
  });

  $(document).click(function() {
    if ($("#slide-down").css("display") != "none") {
      if (event.pageY > ($("#slide-down").position().top + $("#slide-down").outerHeight()))
        hidePostings();
    }
  });
});
