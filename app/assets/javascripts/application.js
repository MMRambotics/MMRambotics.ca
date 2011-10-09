//= require jquery
//= require jquery_ujs

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

function togglePostings() {
  $("#postings").toggle();
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
      $("#slide-down").animate({ height: "0" }, 1000);
      setTimeout(togglePostings, 1000);
      $.visible = false;
    } else {
      $("#slide-down").animate({ height: "400" }, 2000);
      setTimeout(togglePostings, 500);
      $.visible = true;
    }
  });
});
