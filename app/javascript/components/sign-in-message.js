import Typed from 'typed.js';

function loadDynamicSignInMessage() {
  if (document.getElementById("sign-in-message") != null) {
	  new Typed('#sign-in-message', {
	    strings: ["Vous devez vous identifier", "pour accéder à ce dashboard"],
	    typeSpeed: 50,
	    loop: true
	  });
  }
}

export { loadDynamicSignInMessage };