// Expose the native API to javascript
forge.admob = {
    renderBanner: function () {
        forge.internal.call('admob.renderBanner');
    },

    refresh: function(){
      forge.internal.call('admob.refresh');
    }
};