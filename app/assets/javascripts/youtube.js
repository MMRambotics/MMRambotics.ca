function populatePlaylists() {
  $("#youtube-playlists").html('<table id="youtube-playlists-table"><tbody></tbody></table>');
  $.playlists = {}

  var url = "http://gdata.youtube.com/feeds/api/users/" + $.youtubeUser + "/playlists?v=2&alt=jsonc";
  $.getJSON(url, function(data) {
    var playlists = data.data.items;
    for (var i = playlists.length - 1; i >= 0; --i) {
      populatePlaylistVideos(playlists[i]);
      $("#youtube-playlists-table tbody").append('<tr class="playlist" id="playlist-' + playlists[i].id + '"><td class="playlist-image"></td><td>' + playlistData(playlists[i]) + '</td></tr>');
    }
  });
}

function recursivePlaylistVideos(playlist, page) {
  var url = "http://gdata.youtube.com/feeds/api/playlists/" + playlist.id + "?v=2&alt=jsonc";
  if (page != 0) url += "&start-index=" + page * 25;
  $.getJSON(url, function(data) {
    for (var i = 0; i < data.data.items.length; i++) {
      var video = data.data.items[i].video;
      temp = new Object();
      temp.description = video.description;
      temp.permalink = video.player['default'];
      temp.title = video.title;
      temp.thumbnail = video.thumbnail.sqDefault;
      temp.id = video.id;
      temp.date = video.uploaded;
      $.playlists[playlist.id].push(temp);
    }
    if (data.data.items.length == 25) {
      recursivePlaylistVideos(playlist, page + 1);
    } else {
      if ($.playlists[playlist.id].length > 0) {
        $("tr#playlist-" + playlist.id + " .playlist-image").html('<img src="' + $.playlists[playlist.id][0].thumbnail + '" />');
      } else {
        $("tr#playlist-" + playlist.id).hide();
      }
    }
  });
}

function populatePlaylistVideos(playlist) {
  $.playlists[playlist.id] = []
  recursivePlaylistVideos(playlist, 0);
}

function playlistData(playlist) {
  return '<div class="playlist-title">' + playlist.title + '</div>';
}

function switchLightboxVideo(elm) {
  var attrs = elm.attr("id").split("--");
  var index = attrs[1];
  var playlist = attrs[2];
  populateLightboxVideo($.playlists[playlist][index]);
}

function populateLightboxVideo(video) {
  var url = "http://www.youtube.com/v/" + video.id;
  var embed = '<div id="embed-video"><object type="application/x-shockwave-flash" data="' + url + '"><param name="movie" value="' + url + '" /></object></div>';
  var meta  = '<div id="video-data"><div id="video-title">' + video.title + '</div><div id="video-description">' + video.description + '</div></div>';
  $("#view-playlist-video").html(embed + meta);
}

function generateVideoListing(video, videoIndex, playlistId) {
  var id = "video--" + videoIndex + "--" + playlistId;
  return '<tr class="carousel-video" id="' + id + '"><td class="video-carousel-image"><img src="' + video.thumbnail + '" /></td><td><div class="playlist-title">' + video.title + '</div></td></tr>';
}

function showCurrentCarouselSelection() {
  if ($("#video-carousel tbody tr").length < 4) {
    $("#video-carousel tfoot").hide();
    $("#video-carousel thead").hide();
    for (var i = $.svi; i < $.evi; ++i)
      $("#video-carousel tbody tr:eq(" + i + ")").show();
  } else {
    for (var i = $.svi; i != $.evi; i = wrap(i, 1))
      $("#video-carousel tbody tr:eq(" + i + ")").show();
  }
}

function wrap(val, offset) {
  val += offset;
  if (val < 0) 
    val = $("#video-carousel tbody tr").length + val;
  else
    val = val % $("#video-carousel tbody tr").length;
  return val;
}

function moveCarousel(offset) {
  for (var i = $.svi; i != $.evi; i = wrap(i, 1))
    $("#video-carousel tbody tr:eq(" + i + ")").hide();
  $.svi = wrap($.svi, offset);
  $.evi = wrap($.evi, offset);
  showCurrentCarouselSelection();
}

function populateLightboxVideoCarousel(videos, playlistId) {
  $.svi = 0;
  $.evi = (videos.length > 4) ? 4 : videos.length;
  var carousel = '<table id="video-carousel"><thead><td id="carousel-up" colspan="2"><img src="/uparrow.gif" /></td></thead><tbody>';
  for (var i = 0; i < videos.length; ++i)
    carousel += generateVideoListing(videos[i], i, playlistId);
  carousel += '</tbody><tfoot><td colspan="2" id="carousel-down"><img src="/downarrow.gif" /></td></tfoot></table>';
  $("#view-playlist-carousel").html(carousel);
  showCurrentCarouselSelection();
}

function prepareLightbox(id) {
  var videos = $.playlists[id];
  $("#lightbox-content").html('<table id="view-playlist-table"><tr><td id="view-playlist-video"></td><td id="view-playlist-carousel"></td></tr></table>');
  populateLightboxVideo(videos[0]);
  populateLightboxVideoCarousel(videos, id);
}

function openPlaylist(elm) {
  var id = elm.attr("id").substring(9);
  prepareLightbox(id);
  showLightbox();
}

function outsideLightboxContent(x, y) {
  var l = $("#lightbox-content").position();
  var x1 = l.left;
  var y1 = l.top;
  var x2 = x1 + $("#lightbox-content").outerWidth();
  var y2 = y1 + $("#lightbox-content").outerHeight();
  return (x < x1 || y < y1 || y > y2 || x > x2);
}

$(function() {
  if ($("#youtube-playlists").length == 1) {
    $.youtubeUser = "mmrambotics";
    populatePlaylists();

    $("tr.playlist").live("click", function() {
      openPlaylist($(this));
    });

    $("#carousel-up").live("click", function() {
      moveCarousel(-4);
    });

    $("#carousel-down").live("click", function() {
      moveCarousel(4);
    });

    $(".carousel-video").live("click", function() {
      switchLightboxVideo($(this));
    });
  }
});
