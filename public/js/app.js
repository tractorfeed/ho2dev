$(document).ready(function () {
  PermitMapping.init();
});

var PermitMapping = (function ($, L) {
  var hoods = false,
      hood_layer = false,
      map = false,
      ui = {},
      cache = {},
      uiOnReady = false,
      initialized = false;

  ui.types = function(cb) {
    if(cache.types) {
      cb(cache.types);
    } else {
      $.getJSON('/api/permits/types', function(data) {
        cache.types = data;
        cb(data);
      });
    };
  }

  ui.statuses = function(cb) {
    if(cache.statuses) {
      cb(cache.statuses);
    } else {
      $.getJSON('/api/permits/statuses', function(data) {
        cache.statuses = data;
        cb(data);
      });
    };
  }

  function initialize() {
    map = L.map('map').setView([41.2586, -95.9375], 12);
    L.tileLayer('http://{s}.tile.cloudmade.com/1a1b06b230af4efdbb989ea99e9841af/997/256/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>',
      maxZoom: 18
    }).addTo(map);
    hood_layer = L.geoJson().addTo(map);
    if(hoods) {
      plotHoods();
    }
    cache.statuses = false;
    cache.types = false;
    cache.hoods = false;
  }

  function plotHoods() {
    $.each(hoods, function(idx, hood) {
      hood_layer.addData(hood);
    });
  }

  function plotSummary() {
    
  };

  function loadSummary() {
    var hoods_geo_xhr = $.ajax('/js/owh-hoods.json', function(data) {
      hoods = data.features;
    });
    var hoods_summary_xhr = $.getJSON('/api/permits/summary', function(data) {
      hood_summaries = data;
    });
    $.when(hoods_geo_xhr, hoods_summary_xhr).then(function () {

    });
  };

  return {
    loadHoods : function(data) {
      hoods = data.features;
      if(hood_layer) {
        plotHoods();
      }
      console.log(hoods);
    },

    ready : function(fx) {
      if(initialized) {
        fx();
      } else {
        uiOnReady = fx;
      }
    },

    init : function() {
      initialize();
      if(uiOnReady) {
        uiOnReady();
      }
      initialized = true;
    },

    UI : ui
  }  
})(jQuery, L);
