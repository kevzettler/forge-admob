// Expose the native API to javascript
forge.admob = {
    footerBanner: function () {
        forge.internal.call('admob.footerBanner');
    },

    refresh: function(){
      forge.internal.call('admob.refresh');
    }
};