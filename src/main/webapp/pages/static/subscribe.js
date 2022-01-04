const inputContainers = document.querySelectorAll(".app-input");

inputContainers.forEach((container) => {
    const input = container.querySelector("input");
    const events = ["focus", "blur"];

    events.forEach((event) => {
        input.addEventListener(event, () => {
            if (!input.value) {
                toggleClass(container, "input-active");
            }
        });
    });
});

function toggleClass(element, className) {
    const isActive = element.classList.contains(className);

    if (isActive) {
        element.classList.remove(className);
    } else {
        element.classList.add(className);
    }
}

const submitButton = document.querySelector('.app-login-button');
submitButton.disabled = true
function isEmpty() {
    let full_name = document.getElementById('id_full_name').value;
    let email = document.getElementById('id_email').value;
    let phone = document.getElementById('id_phone').value;

    if (full_name.length > 4 && email.length > 4 && (phone.length > 9 && phone.length < 11)) {
        submitButton.disabled = false;
    }
    else {
        submitButton.disabled = true;
    }
}

$('.app-login-button').click(function() {
    $(this).attr('disabled', true);
    $(this).html('<i class="fas fa-spinner fa-spin"></i>');
    $(this).closest('form').submit();
});