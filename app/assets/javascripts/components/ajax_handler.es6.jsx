
'use strict';

class AjaxHandler{
  constructor(url, method){
    this.url = url
    this.method = method
    this.defaults = { method: 'POST', async: false, context: $(this) }
    this.options = { method: this.method, async: false, url: this.url }
    this.value = $.extend({}, this.defaults, this.options)
  }

  run() {
    return $.ajax( this.value );
  }

  send(information) {
    return $.ajax(
      {
        method: this.method,
        data: information,
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url: this.url,
        async: false,
        context: $(this)
      });
  }
}
