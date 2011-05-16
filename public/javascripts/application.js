// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
reloadInfo = function(type) {
  // tbl = $('table#'+type+'Data');
  obj = $('div#'+type+' div.data');
  obj.slideUp('fast', function(){
    obj.load("/gadgets/"+type, function(){
      obj.slideDown('fast');
    });
  });   
}

launchJob = function() {
  obj = $('div#queue div.data');
  stat = $('div#status');
  obj.slideUp('fast', function(){
    stat.load("/gadgets/launch", function(){
      obj.load("/gadgets/queue", function(){
        obj.slideDown('fast');
      });
    });
  });
}
