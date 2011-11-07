
var BRAND = {

  init : function() {

  },

  show : {

    load_tweets : function(tweets) {

      var i, len, target = $('#recent_tweets'), list;

      list = '';
      for (i = 0, len = tweets.length; i < len; i++) {
        list += '<li>' + tweets[i].text + '</li>';
      }

      target.append(list);
    }
  }
};
