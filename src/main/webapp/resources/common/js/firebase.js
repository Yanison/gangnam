 // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.14.0/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.14.0/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  const firebaseConfig = {
    apiKey: "AIzaSyCMD-joeDn1msJE5OOsoswuPpdZ15_x9Ws",
    authDomain: "sgworld-b85ac.firebaseapp.com",
    projectId: "sgworld-b85ac",
    storageBucket: "sgworld-b85ac.appspot.com",
    messagingSenderId: "806659957268",
    appId: "1:806659957268:web:4580f5be3a82496eebfd01",
    measurementId: "G-PRFBDX8VE7"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);