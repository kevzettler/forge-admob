// Expose the native API to javascript
forge.admob = {
    showAlert: function (text, success, error) {
        forge.internal.call('admob.showAlert', {text: text}, success, error);
    }
};

// Register for our native event
forge.internal.addEventListener("admob.resume", function () {
	alert("Welcome back!");
});
