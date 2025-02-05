/* index.js */

function submitForm(e) {
    e.preventDefault();

    nameInput = document.getElementById("name");
    emailInput = document.getElementById("email");
    messageInput = document.getElementById("message");

    nameError = document.getElementById('nameError');
    emailError = document.getElementById('emailError')
    contentError = document.getElementById('contentError')

    let isValid = true;
    console.log("submited form")

    const name = nameInput.value;
    if(name.trim() === '') {
        nameError.textContent = 'Name is required'
        isValid = false;
    }
    
    if(isValid) {
        
        // api call database
        alert("Form Submitted")
        // return true;
    }
}
